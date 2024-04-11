import React from 'react'
import './Others.css'

const DropDown = ({ selection, handleChange, dropDownOptions }) => {
  return (
    <select className='select-dropdown' value={selection} onChange={handleChange}>
      <option className='option-dropdown' value="" disabled>
        Select an option
      </option>
      {dropDownOptions.map((option) => (
        <option className='option-dropdown' key={option.id} value={option.name}>
          {option.name}
        </option>
      ))}
    </select>
  )
}

export default DropDown
