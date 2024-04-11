import React, { useState, useEffect } from 'react';
import './Responses.css';
import * as XLSX from 'xlsx';
import { saveAs } from 'file-saver';
import { jsPDF } from 'jspdf';
import html2canvas from 'html2canvas';
import 'jspdf-autotable';


const Responses = () => {
  const [data, setData] = useState([]);
  const [sortConfig, setSortConfig] = useState({ key: null, direction: 'ascending' });
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = () => {
    fetch('http://localhost/dbm-sri/api/responses.php')
      .then((response) => response.json())
      .then((data) => setData(data))
      .catch((error) => console.error('Error fetching data:', error));
  };

  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  const sortedData = () => {
    const sortableData = [...data];
    if (sortConfig.key) {
      sortableData.sort((a, b) => {
        if (a[sortConfig.key] < b[sortConfig.key]) {
          return sortConfig.direction === 'ascending' ? -1 : 1;
        }
        if (a[sortConfig.key] > b[sortConfig.key]) {
          return sortConfig.direction === 'ascending' ? 1 : -1;
        }
        return 0;
      });
    }
    return sortableData;
  };

  const getSortIcon = (key) => {
    if (sortConfig.key === key) {
      return sortConfig.direction === 'ascending' ? '▲' : '▼';
    }
    return '▲';
  };

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredData = sortedData().filter((item) => {
    return Object.values(item).some((value) =>
      value.toString().toLowerCase().includes(searchTerm.toLowerCase())
    );
  });

  const exportToExcel = () => {
    const fileType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
    const fileExtension = '.xlsx';

    const ws = XLSX.utils.json_to_sheet(filteredData);
    const wb = { Sheets: { 'data': ws }, SheetNames: ['data'] };
    const excelBuffer = XLSX.write(wb, { bookType: 'xlsx', type: 'array' });

    const blob = new Blob([excelBuffer], { type: fileType });
    saveAs(blob, 'sri_table_data' + fileExtension);
  };

  const exportToPDF = () => {
    const input = document.getElementById('table-to-export');
  
    // Extract data for the first 9 columns
    const tableData = [];
    const numRows = filteredData.length;
    for (let i = 0; i < numRows; i++) {
      const rowData = [];
      for (let j = 0; j < 9; j++) { // Extract only the first 9 columns
        rowData.push(filteredData[i][Object.keys(filteredData[i])[j]]);
      }
      tableData.push(rowData);
    }
  
    // Generate PDF
    const pdf = new jsPDF();
    pdf.autoTable({
      head: [ // Header row
        ['Name', 'Designation', 'Contact Number', 'Email', 'Year', 'Category', 'Department Name', 'Agency Name', 'Name of SUC']
      ],
      body: tableData, // Table data for the first 9 columns
      styles: {
        fontSize: 4, // Set font size for the table contents
        font: 'arial', // Set font family
        textColor: '#282828', // Set font color
        fillColor: '#FFFFFF', // Set header background color
        
      },
      headStyles: {
        fontSize: 6, // Set font size for the header row
        font: 'arial', // Set font family
        textColor: '#FFFFFF', // Set font color
        fillColor: '#282828',
        lineWidth: 0.1, // Set border width
        lineColor: '#282828' // Set border color
      }
    });
  
    // Save the PDF
    pdf.save('sri_table_data.pdf');
  };

  return (
    <div className="res-container">
      <div className="res-header-container">
        <input
          className="res-search-input"
          type="text"
          placeholder="Search..."
          value={searchTerm}
          onChange={handleSearch}
        />
        <button className="res-export-button" onClick={exportToExcel}>Export to Excel</button>
        <button className="res-export-button" onClick={exportToPDF}>Export to PDF</button>
      </div>
      <div className="res-table-wrapper">
        <table className="res-table" id="table-to-export">
          <thead>
            <tr className="res-tr-header">
              <th className="res-th" onClick={() => handleSort('submitName')}>
                Name {getSortIcon('submitName')}
              </th>
              <th className="res-th" onClick={() => handleSort('designation')}>
                Designation {getSortIcon('designation')}
              </th>
              <th className="res-th" onClick={() => handleSort('contactNumber')}>
                Contact Number {getSortIcon('contactNumber')}
              </th>
              <th className="res-th" onClick={() => handleSort('email')}>
                Email {getSortIcon('email')}
              </th>
              <th className="res-th" onClick={() => handleSort('_year')}>
                Year {getSortIcon('_year')}
              </th>
              <th className="res-th" onClick={() => handleSort('category')}>
                Category {getSortIcon('category')}
              </th>
              <th className="res-th" onClick={() => handleSort('department')}>
                Department Name {getSortIcon('department')}
              </th>
              <th className="res-th" onClick={() => handleSort('agency')}>
                Agency Name {getSortIcon('agency')}
              </th>
              <th className="res-th" onClick={() => handleSort('nameSUC')}>
                Name of SUC {getSortIcon('nameSUC')}
              </th>
              <th className="res-th" onClick={() => handleSort('nameGOCC')}>
                Name of GOCCs {getSortIcon('nameGOCC')}
              </th>
              <th className="res-th" onClick={() => handleSort('nameLWD')}>
                Name of LWDs {getSortIcon('nameLWD')}
              </th>
              <th className="res-th" onClick={() => handleSort('provinceLGU')}>
                Province {getSortIcon('provinceLGU')}
              </th>
              <th className="res-th" onClick={() => handleSort('cityMunicipalLGU')}>
                City/Municipality {getSortIcon('cityMunicipalLGU')}
              </th>
              <th className="res-th" onClick={() => handleSort('nameSUC')}>
                Name of SUCs {getSortIcon('nameSUC')}
              </th>
              <th className="res-th" onClick={() => handleSort('nameOthers')}>
                Other Agency Category {getSortIcon('nameOthers')}
              </th>
              <th className="res-th" onClick={() => handleSort('agencyHead')}>
                Agency Head {getSortIcon('agencyHead')}
              </th>
              <th className="res-th" onClick={() => handleSort('_grant')}>
                FY 2023 SRI Grant? {getSortIcon('_grant')}
              </th>
              <th className="res-th" onClick={() => handleSort('qualifiedCivilian')}>
                No. of Qualified Civilian {getSortIcon('qualifiedCivilian')}
              </th>
              <th className="res-th" onClick={() => handleSort('qualifiedMUP')}>
                No. of Qualified MUP {getSortIcon('qualifiedMUP')}
              </th>
              <th className="res-th" onClick={() => handleSort('qualifiedContractual')}>
                No. of Qualified Contractual {getSortIcon('qualifiedContractual')}
              </th>
              <th className="res-th" onClick={() => handleSort('qualifiedCasual')}>
                No. of Qualified Casual {getSortIcon('qualifiedCasual')}
              </th>
              <th className="res-th" onClick={() => handleSort('SRIRate')}>
                SRI Rate {getSortIcon('SRIRate')}
              </th>
              <th className="res-th" onClick={() => handleSort('ratePaid')}>
                Total Rate Paid {getSortIcon('ratePaid')}
              </th>
              <th className="res-th" onClick={() => handleSort('PSFund')}>
                Total Personnel Services (PS) Amount {getSortIcon('PSFund')}
              </th>
              <th className="res-th" onClick={() => handleSort('totalMOOE')}>
                Total MOOE Amount {getSortIcon('totalMOOE')}
              </th>
              <th className="res-th" onClick={() => handleSort('travellingExpenses')}>
                Travelling {getSortIcon('travellingExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('trainingScholarship')}>
                Training and Scholarship {getSortIcon('trainingScholarship')}
              </th>
              <th className="res-th" onClick={() => handleSort('suppliesMaterialsExpenses')}>
               Training and Scholarship {getSortIcon('suppliesMaterialsExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('utilityExpenses')}>
                Utility {getSortIcon('utilityExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('communicationExpenses')}>
                Communication {getSortIcon('communicationExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('CIEExpenses')}>
              Confidential, Intelligence, and Extraordinary Expenses {getSortIcon('CIEExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('PSExpenses')}>
              Professional Services {getSortIcon('PSExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('GSExpenses')}>
              General Services {getSortIcon('GSExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('repairsMaintenanceExpenses')}>
              Repairs and Maintenance {getSortIcon('repairsMaintenanceExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('FASubsidy')}>
              Financial Assistance / Subsidy: {getSortIcon('FASubsidy')}
              </th>
              <th className="res-th" onClick={() => handleSort('TIPFees')}>
              Taxes, Insurance Premiums, and Other Fees {getSortIcon('TIPFees')}
              </th>
              <th className="res-th" onClick={() => handleSort('laborWages')}>
              Labor and Wages {getSortIcon('laborWages')}
              </th>
              <th className="res-th" onClick={() => handleSort('advertisingExpenses')}>
              Advertising {getSortIcon('advertisingExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('printingPublicationExpenses')}>
              Printing and Publication {getSortIcon('printingPublicationExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('representationExpenses')}>
                Representation {getSortIcon('representationExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('transpoDeliveryExpenses')}>
              Transportation and Delivery {getSortIcon('transpoDeliveryExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('rentLeaseExpenses')}>
              Rent / Lease {getSortIcon('rentLeaseExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('MDCOExpenses')}>
              Membership Dues and Contributions to Organizations {getSortIcon('MDCOExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('subscriptionExpenses')}>
                Subscription {getSortIcon('subscriptionExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('otherExpenses')}>
              Others(Research, Exploration, and Devt. Exp) {getSortIcon('otherExpenses')}
              </th>
              <th className="res-th" onClick={() => handleSort('grandTotal')}>
              Grand Total (PS + MOOE) {getSortIcon('grandTotal')}
              </th>
              <th className="res-th" onClick={() => handleSort('nonGrantReason')}>
                Non-Grant Reason {getSortIcon('nonGrantReason')}
              </th>
              <th className="res-th" onClick={() => handleSort('filename')}>
                Filename {getSortIcon('filename')}
              </th>
              <th className="res-th" onClick={() => handleSort('filesize')}>
                Filesize {getSortIcon('filesize')}
              </th>
              <th className="res-th" onClick={() => handleSort('filetype')}>
                Filetype {getSortIcon('filetype')}
              </th>
            </tr>
          </thead>
          <tbody>
            {filteredData.map((item, index) => (
              <tr key={index}>
                <td className="res-td">{item.submitName}</td>
                <td className="res-td">{item.designation}</td>
                <td className="res-td">{item.contactNumber}</td>
                <td className="res-td">{item.email}</td>
                <td className="res-td">{item._year}</td>
                <td className="res-td">{item.category}</td>
                <td className="res-td">{item.department}</td>
                <td className="res-td">{item.agency}</td>
                <td className="res-td">{item.university}</td>
                <td className="res-td">{item.nameGOCC}</td>
                <td className="res-td">{item.nameLWD}</td>
                <td className="res-td">{item.provinceLGU}</td>
                <td className="res-td">{item.cityMunicipalLGU}</td>
                <td className="res-td">{item.nameSUC}</td>
                <td className="res-td">{item.nameOthers}</td>
                <td className="res-td">{item.agencyHead}</td>
                <td className="res-td">{item._grant}</td>
                <td className="res-td">{item.qualifiedCivilian}</td>
                <td className="res-td">{item.qualifiedMUP}</td>
                <td className="res-td">{item.qualifiedContractual}</td>
                <td className="res-td">{item.qualifiedCasual}</td>
                <td className="res-td">{item.SRIRate}</td>
                <td className="res-td">{item.ratePaid}</td>
                <td className="res-td">{item.PSFund}</td>
                <td className="res-td">{item.totalMOOE}</td>
                <td className="res-td">{item.travellingExpenses}</td>
                <td className="res-td">{item.trainingScholarship}</td>
                <td className="res-td">{item.suppliesMaterialsExpenses}</td>
                <td className="res-td">{item.utilityExpenses}</td>
                <td className="res-td">{item.communicationExpenses}</td>
                <td className="res-td">{item.CIEExpenses}</td>
                <td className="res-td">{item.PSExpenses}</td>
                <td className="res-td">{item.GSExpenses}</td>
                <td className="res-td">{item.repairsMaintenanceExpenses}</td>
                <td className="res-td">{item.FASubsidy}</td>
                <td className="res-td">{item.TIPFees}</td>
                <td className="res-td">{item.laborWages}</td>
                <td className="res-td">{item.advertisingExpenses}</td>
                <td className="res-td">{item.printingPublicationExpenses}</td>
                <td className="res-td">{item.representationExpenses}</td>
                <td className="res-td">{item.transpoDeliveryExpenses}</td>
                <td className="res-td">{item.rentLeaseExpenses}</td>
                <td className="res-td">{item.MDCOExpenses}</td>
                <td className="res-td">{item.subscriptionExpenses}</td>
                <td className="res-td">{item.otherExpenses}</td>
                <td className="res-td">{item.grandTotal}</td>
                <td className="res-td">{item.nonGrantReason}</td>
                <td className="res-td">{item.filename}</td>
                <td className="res-td">{item.filesize}</td>
                <td className="res-td">{item.filetype}</td>
              </tr>
            ))}
          </tbody>
          </table>
        </div>
      </div>
    );
};

export default Responses;

