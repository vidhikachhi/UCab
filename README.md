# UCab - Full-Stack Cab Booking App

A modern, responsive cab booking application built with React, Node.js, Express, and MongoDB.

## Features

- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Booking Management**: Create, view, and cancel cab bookings
- **Ride Status Tracking**: Track your ride status (Pending, On The Way, Arrived, Completed)
- **Fare Estimation**: Calculate fare estimates before booking
- **Multiple Cab Types**: Choose from Mini, Sedan, or SUV

## Tech Stack

### Frontend
- React (Create React App)
- React Router for navigation
- Context API for state management
- Tailwind CSS for styling
- Axios for API communication
- React Toastify for notifications

### Backend
- Node.js
- Express framework
- MongoDB database
- Mongoose ODM
- Cors for cross-origin support
- Dotenv for environment variables

## Project Structure
```
swiftcab-fullstack/
├── frontend/             # React frontend
│   ├── public/           # Static files
│   └── src/              # React source code
│       ├── components/   # Reusable components
│       ├── context/      # React Context for state
│       ├── pages/        # Page components
│       └── App.js        # Main App component
│
└── backend/              # Express backend
    ├── controllers/      # Route controllers
    ├── models/           # Mongoose models
    ├── routes/           # API routes
    └── server.js         # Entry point


`http://localhost:3000`
