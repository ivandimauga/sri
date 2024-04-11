import './App.css'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import Forms from './Forms'
import Responses from './Responses'

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Forms />} />{' '}
        <Route path="/Responses" element={<Responses />} />{' '}
      </Routes>
    </Router>
  )
}

export default App
