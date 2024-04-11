import React from 'react'
import './Others.css'

const RadioButtons = ({ selection, handleChange, categoryOptions }) => {
  return (
    <>
      {categoryOptions.map((option) => (
        <div className='radio-key' key={option.value}>
          <input
            className='radio-input'
            type="radio"
            id={option.value}
            name="selection"
            value={option.value}
            checked={selection === option.value}
            onChange={handleChange}
          />
          <label htmlFor={option.value}>{option.label}</label>
        </div>
      ))}
    </>
  )
}

export default RadioButtons
