import React, { useState, useRef, useEffect, setLoading } from 'react'
import RadioButtons from './RadioButtons'
import DropDown from './DropDown'
import axios from 'axios'
import emailjs from '@emailjs/browser'
import './Forms.css'
import logo from './logo.png'

const Forms = () => {
  const form = useRef()

  useEffect(() => emailjs.init('00cv3Uj8WhpJVca32'), [])

  const yearOptions = [
    { label: '2024', value: '2024' },
    { label: '2025', value: '2025' },
    { label: '2026', value: '2026' },
  ]

  const categoryOptions = [
    { label: 'NGAs', value: 'NGAs' },
    { label: 'GOCCs', value: 'GOCCs' },
    { label: 'LWDs', value: 'LWDs' },
    { label: 'LGUs', value: 'LGUs' },
    { label: 'SUCs', value: 'SUCs' },
    { label: 'Others', value: 'Others' },
  ]

  const grantOptions = [
    { label: 'YES', value: 'YES' },
    { label: 'NO', value: 'NO' },
  ]

  const [_year, setYear] = useState('')
  const [category, setCategory] = useState('')
  const [department, setDepartment] = useState('')
  const [agency, setAgency] = useState('')
  const [showNGA, setShowNGA] = useState(false)
  const [showGOCC, setShowGOCC] = useState(false)
  const [showLWD, setShowLWD] = useState(false)
  const [showLGU, setShowLGU] = useState(false)
  const [showSUC, setShowSUC] = useState(false)
  const [university, setUniversity] = useState('')
  const [showOthers, setShowOthers] = useState(false)
  const [nameGOCC, setGOCCName] = useState('')
  const [nameLWD, setLWDName] = useState('')
  const [provinceLGU, setLGUProvince] = useState('')
  const [cityMunicipalLGU, setLGUCityMunicipal] = useState('')
  const [nameSUC, setSUCName] = useState('')
  const [nameOthers, setOthersName] = useState('')
  const [submitName, setSubmitName] = useState('')
  const [designation, setDesignation] = useState('')
  const [contactNumber, setContactNumber] = useState('')
  const [email, setEmail] = useState('')
  const [agencyHead, setAgencyHead] = useState('')
  const [_grant, setGrant] = useState('')
  const [showYES, setShowYES] = useState(false)
  const [showNO, setShowNO] = useState(false)
  const [qualifiedCivilian, setQualifiedCivilian] = useState(0)
  const [qualifiedMUP, setQualifiedMUP] = useState(0)
  const [qualifiedContractual, setQualifiedContractual] = useState(0)
  const [qualifiedCasual, setQualifiedCasual] = useState(0)
  const [SRIRate, setSRIRate] = useState(0)
  const [ratePaid, setRatePaid] = useState(0)
  const [PSFund, setPSFund] = useState(0)
  const [travellingExpenses, setTravellingExpenses] = useState(0)
  const [trainingScholarship, setTrainingScholarship] = useState(0)
  const [suppliesMaterialsExpenses, setSuppliesMaterialsExpenses] = useState(0)
  const [utilityExpenses, setUtilityExpenses] = useState(0)
  const [communicationExpenses, setCommunicationExpenses] = useState(0)
  const [CIEExpenses, setCIEExpenses] = useState(0)
  const [PSExpenses, setPSExpenses] = useState(0)
  const [GSExpenses, setGSExpenses] = useState(0)
  const [repairsMaintenanceExpenses, setRepairsMaintenanceExpenses] = useState(0)
  const [FASubsidy, setFASubsidy] = useState(0)
  const [TIPFees, setTIPFees] = useState(0)
  const [laborWages, setLaborWages] = useState(0)
  const [advertisingExpenses, setAdvertisingExpenses] = useState(0)
  const [printingPublicationExpenses, setPrintingPublicationExpenses] = useState(0)
  const [representationExpenses, setRepresentationExpenses] = useState(0)
  const [transpoDeliveryExpenses, setTranspoDeliveryExpenses] = useState(0)
  const [rentLeaseExpenses, setRentLeaseExpenses] = useState(0)
  const [MDCOExpenses, setMDCOExpenses] = useState(0)
  const [subscriptionExpenses, setSubscriptionExpenses] = useState(0)
  const [otherExpenses, setOtherExpenses] = useState(0)
  const [totalMOOE, setTotalMOOE] = useState(0)
  const [grandTotal, setGrandTotal] = useState(0)
  const [nonGrantReason, setNonGrantReason] = useState('')
  const [reportFile, setReportFile] = useState(null)
  const [timeSubmitted, setTimeSubmitted] = useState(null)
  const [departmentOptions, setDepartmentOptions] = useState([])
  const [agencyOptions, setAgencyOptions] = useState([])
  const [universityOptions, setUniversityOptions] = useState([])
  const [sendReceipt, setSendReceipt] = useState(false)

  useEffect(() => {
    fetchDepartments()
  }, [])

  useEffect(() => {
    if (department !== '') {
      fetchAgencies(department)
    }
  }, [department])

  useEffect(() => {
    fetchUniversities()
  }, [])

  const fetchDepartments = async () => {
    try {
      const response = await fetch('http://localhost/dbm-sri/api/departments.php')
      if (!response.ok) {
        throw new Error('Failed to fetch departments')
      }
      const data = await response.json()
      setDepartmentOptions(data)
    } catch (error) {
      console.error('Error fetching departments:', error.message)
    }
  }

  console.log(department)

  const fetchAgencies = async (departmentId) => {
    try {
      const response = await fetch(
        `http://localhost/dbm-sri/api/departments.php?department_id="${departmentId}"`
      )
      if (!response.ok) {
        throw new Error('Failed to fetch agencies')
      }
      const data = await response.json()
      setAgencyOptions(data)
    } catch (error) {
      console.error('Error fetching agencies:', error.message)
    }
  }

  const fetchUniversities = async () => {
    try {
      const response = await fetch(
        'http://localhost/dbm-sri/api/universities.php'
      )
      if (!response.ok) {
        throw new Error('Failed to fetch universities')
      }
      const data = await response.json()
      setUniversityOptions(data)
    } catch (error) {
      console.error('Error fetching universities:', error.message)
    }
  }

  const handleDepartmentChange = (event) => {
    setDepartment(event.target.value)
  }

  const handleCategoryChange = (event) => {
    setCategory(event.target.value)
    if (event.target.value === 'NGAs') {
      setShowNGA(true)
      setShowGOCC(false)
      setShowLWD(false)
      setShowLGU(false)
      setShowSUC(false)
      setShowOthers(false)
    } else if (event.target.value === 'GOCCs') {
      setShowNGA(false)
      setShowGOCC(true)
      setShowLWD(false)
      setShowLGU(false)
      setShowSUC(false)
      setShowOthers(false)
    } else if (event.target.value === 'LWDs') {
      setShowNGA(false)
      setShowGOCC(false)
      setShowLWD(true)
      setShowLGU(false)
      setShowSUC(false)
      setShowOthers(false)
    } else if (event.target.value === 'LGUs') {
      setShowNGA(false)
      setShowGOCC(false)
      setShowLWD(false)
      setShowLGU(true)
      setShowSUC(false)
      setShowOthers(false)
    } else if (event.target.value === 'SUCs') {
      setShowNGA(false)
      setShowGOCC(false)
      setShowLWD(false)
      setShowLGU(false)
      setShowSUC(true)
      setShowOthers(false)
    } else if (event.target.value === 'Others') {
      setShowNGA(false)
      setShowGOCC(false)
      setShowLWD(false)
      setShowLGU(false)
      setShowSUC(false)
      setShowOthers(true)
    } else {
      setShowNGA(false)
      setShowGOCC(false)
      setShowLWD(false)
      setShowLGU(false)
      setShowSUC(false)
      setShowOthers(false)
    }
  }

  const handleAgencyChange = (event) => {
    setAgency(event.target.value)
  }

  const handleUniversityChange = (event) => {
    setUniversity(event.target.value)
  }

  const handleGrantChange = (event) => {
    setGrant(event.target.value)
    if (event.target.value === 'YES') {
      setShowYES(true)
      setShowNO(false)
    } else if (event.target.value === 'NO') {
      setShowYES(false)
      setShowNO(true)
    } else {
      setShowYES(false)
      setShowNO(false)
    }
  }

  const refreshForm = () => {
    setYear('')
    setCategory('')
    setDepartment('')
    setAgency('')
    setShowNGA(false)
    setShowGOCC(false)
    setShowLWD(false)
    setShowLGU(false)
    setShowSUC(false)
    setUniversity('')
    setShowOthers(false)
    setGOCCName('')
    setLWDName('')
    setLGUProvince('')
    setLGUCityMunicipal('')
    setSUCName('')
    setOthersName('')
    setSubmitName('')
    setDesignation('')
    setContactNumber('')
    setEmail('')
    setAgencyHead('')
    setGrant('')
    setShowYES(false)
    setShowNO(false)
    setQualifiedCivilian(0)
    setQualifiedMUP(0)
    setQualifiedContractual(0)
    setQualifiedCasual(0)
    setSRIRate(0)
    setRatePaid(0)
    setPSFund(0)
    setTotalMOOE(0)
    setTravellingExpenses(0)
    setTrainingScholarship(0)
    setSuppliesMaterialsExpenses(0)
    setUtilityExpenses(0)
    setCommunicationExpenses(0)
    setCIEExpenses(0)
    setPSExpenses(0)
    setGSExpenses(0)
    setRepairsMaintenanceExpenses(0)
    setFASubsidy(0)
    setTIPFees(0)
    setLaborWages(0)
    setAdvertisingExpenses(0)
    setPrintingPublicationExpenses(0)
    setRepresentationExpenses(0)
    setTranspoDeliveryExpenses(0)
    setRentLeaseExpenses(0)
    setMDCOExpenses(0)
    setSubscriptionExpenses(0)
    setOtherExpenses(0)
    setGrandTotal(0)
    setNonGrantReason('')
    setReportFile(null)
    setTimeSubmitted(null)
    window.location.reload()
  }

  const handleSendReceipt = () => {
    setSendReceipt(!sendReceipt)
  }

  const handleFileChange = (e) => {
    setReportFile(e.target.files[0])
  }

  const computeTotalMOOE = () => {
    let MOOE = parseInt(travellingExpenses) +
    parseInt(trainingScholarship) +
    parseInt(suppliesMaterialsExpenses) +
    parseInt(utilityExpenses) +
    parseInt(communicationExpenses) +
    parseInt(CIEExpenses) +
    parseInt(PSExpenses) +
    parseInt(GSExpenses) +
    parseInt(repairsMaintenanceExpenses) +
    parseInt(FASubsidy) +
    parseInt(TIPFees) +
    parseInt(laborWages) +
    parseInt(advertisingExpenses) +
    parseInt(printingPublicationExpenses) +
    parseInt(representationExpenses) +
    parseInt(transpoDeliveryExpenses) +
    parseInt(rentLeaseExpenses) +
    parseInt(MDCOExpenses) +
    parseInt(subscriptionExpenses) +
    parseInt(otherExpenses)

    return MOOE
  }

  useEffect(() => {
    const totalMOOEValue = computeTotalMOOE();
    setTotalMOOE(totalMOOEValue);
  }, [travellingExpenses, trainingScholarship, suppliesMaterialsExpenses, utilityExpenses, communicationExpenses, CIEExpenses, PSExpenses, GSExpenses, repairsMaintenanceExpenses, FASubsidy, TIPFees, laborWages, advertisingExpenses, printingPublicationExpenses, representationExpenses, transpoDeliveryExpenses, rentLeaseExpenses, MDCOExpenses, subscriptionExpenses, otherExpenses]);
  
  const computeGrandTotal = () => {
    let grandTotalValue = parseInt(PSFund) + parseInt(totalMOOE)

    return grandTotalValue
  }

  useEffect(() => {
    const grandTotalValue = computeGrandTotal();
    setGrandTotal(grandTotalValue);
  }, [PSFund, totalMOOE]);

  const handleSubmit = async (e) => {
    e.preventDefault()

    const timeNow = new Date().getTime()
    setTimeSubmitted(timeNow)

    const formData = new FormData()

    formData.append('submitName', submitName)
    formData.append('designation', designation)
    formData.append('contactNumber', contactNumber)
    formData.append('email', email)
    formData.append('_year', _year)
    formData.append('category', category)
    formData.append('department', department)
    formData.append('agency', agency)
    formData.append('university', university)
    formData.append('nameGOCC', nameGOCC)
    formData.append('nameLWD', nameLWD)
    formData.append('provinceLGU', provinceLGU)
    formData.append('cityMunicipalLGU', cityMunicipalLGU)
    formData.append('nameSUC', nameSUC)
    formData.append('nameOthers', nameOthers)
    formData.append('agencyhead', agencyHead)
    formData.append('_grant', _grant)
    formData.append('qualifiedCivilian', qualifiedCivilian)
    formData.append('qualifiedMUP', qualifiedMUP)
    formData.append('qualifiedContractual', qualifiedContractual)
    formData.append('qualifiedCasual', qualifiedCasual)
    formData.append('SRIRate', SRIRate)
    formData.append('ratePaid', ratePaid)
    formData.append('PSFund', PSFund)
    formData.append('totalMOOE', totalMOOE)
    formData.append('travellingExpenses', travellingExpenses)
    formData.append('trainingScholarship', trainingScholarship)
    formData.append('suppliesMaterialsExpenses', suppliesMaterialsExpenses)
    formData.append('utilityExpenses', utilityExpenses)
    formData.append('communicationExpenses', communicationExpenses)
    formData.append('CIEExpenses', CIEExpenses)
    formData.append('PSExpenses', PSExpenses)
    formData.append('GSExpenses', GSExpenses)
    formData.append('repairsMaintenanceExpenses', repairsMaintenanceExpenses)
    formData.append('FASubsidy', FASubsidy)
    formData.append('TIPFees', TIPFees)
    formData.append('laborWages', laborWages)
    formData.append('advertisingExpenses', advertisingExpenses)
    formData.append('printingPublicationExpenses', printingPublicationExpenses)
    formData.append('representationExpenses', representationExpenses)
    formData.append('transpoDeliveryExpenses', transpoDeliveryExpenses)
    formData.append('rentLeaseExpenses', rentLeaseExpenses)
    formData.append('MDCOExpenses', MDCOExpenses)
    formData.append('subscriptionExpenses', subscriptionExpenses)
    formData.append('otherExpenses', otherExpenses)
    formData.append('grandTotal', grandTotal)
    formData.append('PSFund', PSFund)
    formData.append('nonGrantReason', nonGrantReason)
    formData.append('file', reportFile)
    //#endregion

    try {
      const res = await axios.post(
        'http://localhost/dbm-sri/api/responses.php',
        formData,
        {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        }
      )
      console.log('Response:', res.data)
    } catch (error) {
      console.error('Error:', error)
    }

    const adminEmail = "johnbaracael2000@gmail.com"
    try {
      await emailjs.send('service_4t7u7f9', 'template_f3z7vqb', {
        name: submitName,
        email: adminEmail,
      })
      alert('Submitted Successfully')
    } catch (error) {
      console.log(error)
    }

    if (sendReceipt == true) {
      try {
        await emailjs.send('service_4t7u7f9', 'template_s63f4f1', {
          name: submitName,
          email: email,
        })
        alert('Check Your Inbox')
      } catch (error) {
        console.log(error)
      }
    }

    refreshForm()
  }

  return (
    <form ref={form} encType="multipart/form-data">
      <div className='background'>
      <div className='container'>
      <img className='header-img' src={logo} alt="Header Image"/>
        <h1>
          Consolidated Report on the Grant of the FY 2023 Service Recognition Incentive (SRI)
        </h1>
        <hr />
        <h2>Department / Agency Information</h2>
        <div>
          <label className='dai-inside'>
            Year{' '}
            <input className="category-input" onChange={(e) => setYear(e.target.value)}></input>
          </label>
          <br />
          <label className='dai-inside'>
            Category{' '}
            <RadioButtons
              selection={category}
              handleChange={handleCategoryChange}
              categoryOptions={categoryOptions}
            />
          </label>

          <label className='dai-outside'>
            {showNGA && (
              <div>
                <h2>NGAs</h2>
                <hr />
                <label className='dai-inside'>
                  Department Name:{' '}
                  <DropDown
                    selection={department}
                    handleChange={handleDepartmentChange}
                    dropDownOptions={departmentOptions}
                  />
                </label>
                <br />
                <label className='dai-inside'>
                  Agency Name:{' '}
                  <DropDown
                    selection={agency}
                    handleChange={handleAgencyChange}
                    dropDownOptions={agencyOptions}
                  />
                </label>
              </div>
            )}
            {showGOCC && (
              <div>
                <h2>GOCCs</h2>
                <hr />
                <label className='dai-inside'>
                  Name of GOCCs:{' '}
                  <input className='category-input' onChange={(e) => setGOCCName(e.target.value)}></input>
                </label>
              </div>
            )}
            {showLWD && (
              <div>
                <h2>LWDs</h2>
                <hr />
                <label className='dai-inside'>
                  Name of LWDs:{' '}
                  <input className='category-input' onChange={(e) => setLWDName(e.target.value)}></input>
                </label>
              </div>
            )}
            {showLGU && (
              <div>
                <h2>LGUs</h2>
                <hr />
                <label className='dai-inside'>
                  Province{' '}
                  <input
                    className='category-input'
                    onChange={(e) => setLGUProvince(e.target.value)}
                  ></input>
                </label>
                <br />
                <label className='dai-inside'>
                  City / Municipality{' '}
                  <input
                    className='category-input'
                    onChange={(e) => setLGUCityMunicipal(e.target.value)}
                  ></input>
                </label>
              </div>
            )}
            {showSUC && (
              <div>
                <h2>SUCs</h2>
                <hr />
                <label className='dai-inside'>
                  Name of SUCs:{' '}
                  <DropDown
                    selection={university}
                    handleChange={handleUniversityChange}
                    dropDownOptions={universityOptions}
                  />
                </label>
              </div>
            )}
            {showOthers && (
              <div>
                <h2>Others</h2>
                <hr />
                <label className='dai-inside'>
                  Others:{' '}
                  <input
                    className='category-input'
                    onChange={(e) => setOthersName(e.target.value)}
                  ></input>
                </label>
              </div>
            )}
          </label>
        </div>
        <br />

        <h2>Submitted By:</h2>
        <hr />
        <div>
          <label className='sb-name'>
            Name:{' '}
            <input className='submittedby-input' onChange={(e) => setSubmitName(e.target.value)}></input>
          </label>
          <label className='sb-others'>
            Designation:{' '}
            <input className='submittedby-input' onChange={(e) => setDesignation(e.target.value)}></input>
          </label>
          <label className='sb-others'>
            Contact Number:{' '}
            <input className='submittedby-input' onChange={(e) => setContactNumber(e.target.value)}></input>
          </label>
          <label className='sb-others'>
            Email:{' '}
            <input className='submittedby-input' onChange={(e) => setEmail(e.target.value)}></input>
          </label>
          <br />
          <br />
        </div>

        <h2>Certified By:</h2>
        <hr />
        <div>
          <label className='cb-inside'>
            Agency Head: {' '}
            <input className='agencyhead-input' onChange={(e) => setAgencyHead(e.target.value)}></input>
          </label>
          <br />
          <label className='cb-inside'>
            Did your Departments/Agency/Institution grant the FY 2023 SRI{' '}
            <div className='cb-radio'>
            <RadioButtons
              selection={_grant}
              handleChange={handleGrantChange}
              categoryOptions={grantOptions}
            />
            </div>
          </label>
        </div>
        <br />
        
        {showYES && (
          <div>
            <h2>If Granted SRI Incentive</h2>
            <hr />
            <h3>Number of Qualified Personnel</h3>
            <label className='cb-inside'>
              Regular (Civilian): {' '}
              <input
                className='igsi-input'
                type="number"
                onChange={(e) => setQualifiedCivilian(e.target.value)}
              ></input>
            </label>
            <label className='cb-inside'>
                Regular (MUP): {' '}
              <input
                className='igsi-input'
                type="number"
                onChange={(e) => setQualifiedMUP(e.target.value)}
              ></input>
            </label>
            <label className='cb-inside'>
              Contractual: {' '}
              <input
                className='igsi-input'
                type="number"
                onChange={(e) => setQualifiedContractual(e.target.value)}
              ></input>
            </label>
            <label className='cb-inside'>
              Casual: {' '}
              <input
                className='igsi-input'
                type="number"
                onChange={(e) => setQualifiedCasual(e.target.value)}
              ></input>
            </label>
            <label className='cb-inside'>
              Total No. of Qualified Personnel: {parseInt(qualifiedCivilian) + parseInt(qualifiedMUP) + parseInt(qualifiedContractual) + parseInt(qualifiedCasual)} 
            </label>
            <br />
            <br />

            <h2>Rate</h2>
            <hr />
            <label className='cb-inside'>
              Rate of SRI: {' '}
              <input
                className='r-input'
                type="number"
                onChange={(e) => setSRIRate(e.target.value)}
              ></input>
            </label>
            <label className='cb-inside'>
              Total Amount Paid: {' '}
              <input
                className='r-input'
                type="number"
                onChange={(e) => setRatePaid(e.target.value)}
              ></input>
            </label>
            <br />
            <br />

            <h2>Fund Sources - Amount Charged Against Personnel Services (PS) Allotments</h2>
            <hr />
            <div> 
              <label className='cb-inside'>
                Total Amount: {' '}
                <input
                className='fsps-input'
                type='number'
                onChange={(e) => setPSFund(e.target.value)}
                ></input>
              </label>
              <br />
              <br />
            </div>

            <h2>Fund Sources - Amount Charged Against MOOE (Per Object Expenditure)</h2>
            <hr />
            <div>
              <label className='cb-inside'>
                Travelling: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setTravellingExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Training and Scholarship: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setTrainingScholarship(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Supplies and Materials: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setSuppliesMaterialsExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Utility: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setUtilityExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Communication: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setCommunicationExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Confidential, Intelligence, and Extraordinary Expenses: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setCIEExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Professional Services: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setPSExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                General Services: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setGSExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Repairs and Maintenance: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setRepairsMaintenanceExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Financial Assistance / Subsidy: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setFASubsidy(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Taxes, Insurance Premiums, and Other Fees: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setTIPFees(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Labor and Wages: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setLaborWages(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Advertising: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setAdvertisingExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Printing and Publication: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setPrintingPublicationExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Representation: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setRepresentationExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
               Transportation and Delivery: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setTranspoDeliveryExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Rent / Lease: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setRentLeaseExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Membership Dues and Contributions to Organizations {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setMDCOExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Subscription: {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setSubscriptionExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Others(Research, Exploration, and Devt. Exp): {' '}
                <input
                  className='fsmooe-input'
                  type="number"
                  onChange={(e) => setOtherExpenses(e.target.value)}
                ></input>
              </label>
              <br />
              <label className='cb-inside'>
                Total Charges Against MOOE:{' '}
                {totalMOOE}
              </label>
            </div>
            <br />

            <h2>Fund Sources - Grand Total</h2>
            <hr />
            <label className='cb-inside'>
                Grand Total (PS + MOOE):{' '}{grandTotal}
            </label>
            <br />
          </div>
        )}

        {showNO && (
          <div>
            <h2>If the SRI was not Granted</h2>
            <hr />
            <label className='cb-inside'>
              Please state reason/s for non-grant{' '}
              <input
                className='igsin-input'
                onChange={(e) => setNonGrantReason(e.target.value)}
              ></input>
            </label>
          </div>
        )}
        <br />

        <h2>Upload Report</h2>
        <hr />
        <p className='ur-p'> 
          File name shall be &lt;deptname&gt; &lt;agencyname&gt; AnnexA FY2023GP
        </p>
        <label className='ur-inside'>
          Report:{' '}
          <input
            className='ur-input'
            type="file"
            name="file"
            id="file"
            onChange={handleFileChange}
          />
        </label>
        <br />
        <br />

        <div>
          <hr />
          <button className='submit-button' type="submit" onClick={handleSubmit}>
            Submit
          </button>
          <label className='ur-inside'><input type='checkbox' checked={sendReceipt} onChange={handleSendReceipt}/>{' '} Send me a receipt of my response</label>
        </div>
      </div>
      </div>
    </form>
  )
}

export default Forms
