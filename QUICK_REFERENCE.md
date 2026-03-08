# 📖 Swift Cab - Quick Reference Guide

## 🚀 For the Impatient

### Just Want to Run It Locally?

**Windows:**
1. Double-click `RUN.bat` in the root folder
2. MongoDB must be running first
3. Done! Opens on http://localhost:3000

**macOS/Linux:**
```bash
# Terminal 1
cd swiftcab-fullstack/backend && npm run dev

# Terminal 2
cd swiftcab-fullstack/frontend && npm start
```

---

## 🔑 Key Decisions to Make

| Task | Your Choice | Details |
|------|---|---|
| **MongoDB** | Local or Cloud? | See MONGODB_SETUP.md |
| **Deployment** | Where? | Vercel (frontend) + Render (backend) - Recommended |
| **Authentication** | Add later? | Currently no auth, good for future feature |

---

## 📁 Important Files

```
Swift_Cab/
├── README.md                    ← Original project README
├── MONGODB_SETUP.md            ← How to install MongoDB ✨
├── DEPLOYMENT_GUIDE.md         ← How to deploy to production ✨
├── SETUP_CHECKLIST.md          ← Step-by-step checklist ✨
├── RUN.bat                     ← Quick start script (Windows) ✨
│
└── swiftcab-fullstack/
    ├── backend/
    │   ├── server.js           ← Express server
    │   ├── package.json        ← Dependencies
    │   ├── .env                ← Environment variables (your choice)
    │   ├── .env.example        ← Template for .env ✨
    │   ├── .gitignore          ← Protect secrets ✨
    │   └── ...
    │
    └── frontend/
        ├── src/App.js          ← React app
        ├── package.json        ← Dependencies
        ├── .env                ← Environment variables
        ├── .env.example        ← Template for .env ✨
        ├── .gitignore          ← Protect secrets ✨
        └── ...
```

✨ = Created to help you

---

## 🎯 Next Steps (Priority Order)

### 1️⃣ **This Week**
- [ ] Set up MongoDB (Atlas recommended)
- [ ] Update backend `.env` with MongoDB URI
- [ ] Verify backend runs: `npm run dev`
- [ ] Verify frontend runs: `npm start`
- [ ] Test creating a booking

### 2️⃣ **Before Deployment**
- [ ] Push code to GitHub
- [ ] Add all files to git (ensure .env ignored)
- [ ] Create Vercel + Render accounts

### 3️⃣ **Deploy**
- [ ] Deploy frontend to Vercel
- [ ] Deploy backend to Render
- [ ] Update frontend's backend URL
- [ ] Test live application

### 4️⃣ **Future Enhancements**
- Add user authentication
- Add payment integration
- Add real-time notifications
- Add email confirmations
- Add admin dashboard

---

## 🔌 Environment Variables Quick Reference

### Backend (`backend/.env`)
```env
PORT=5000
MONGO_URI=mongodb+srv://admin:PASSWORD@CLUSTER.mongodb.net/swiftcab?retryWrites=true&w=majority
NODE_ENV=development
```

### Frontend (`frontend/.env`)
```env
REACT_APP_API_URL=http://localhost:5000/api
```

---

## 💡 Common Tasks

### Start both servers
```bash
RUN.bat    # Windows only
```

### Install new package
```bash
cd backend (or frontend)
npm install package-name
```

### Fix security vulnerabilities
```bash
npm audit fix
```

### Build for production
```bash
cd frontend
npm run build  # Creates optimized build folder
```

### Check if ports are in use
```bash
# Windows
netstat -ano | findstr :5000
netstat -ano | findstr :3000

# macOS/Linux
lsof -i :5000
lsof -i :3000
```

### Kill process on port
```bash
# Windows
taskkill /PID <PID> /F

# macOS/Linux
kill -9 <PID>
```

---

## 🎨 Project Structure at a Glance

```
Frontend (React)
├── Public pages (Home, BookingForm, Bookings, BookingDetails)
├── Reusable components (Header, Footer)
├── Global state (BookingContext)
├── Styled with Tailwind CSS
└── API calls via Axios

Backend (Node.js + Express)
├── REST API endpoints
├── MongoDB models & schemas
├── Route handlers
└── Environment variables for config
```

---

## 🛠️ API Endpoints (Backend)

```
POST   /api/bookings              Create booking
GET    /api/bookings              Get all bookings
GET    /api/bookings/:id          Get one booking
DELETE /api/bookings/:id          Cancel booking
PATCH  /api/bookings/:id/status   Update status
```

**Example Request:**
```bash
curl -X POST http://localhost:5000/api/bookings \
  -H "Content-Type: application/json" \
  -d '{
    "pickupLocation": "123 Main St",
    "dropoffLocation": "456 Oak Ave",
    "cabType": "sedan"
  }'
```

---

## 🔒 Security Tips

- ✅ Never commit `.env` files
- ✅ Keep passwords out of code
- ✅ Use HTTPS in production (automatic)
- ✅ Validate all user input
- ✅ Enable IP allowlisting in MongoDB Atlas for production
- ⚠️ Don't hardcode sensitive data

---

## 📊 Monitoring Commands

### Check Backend Logs (Production)
1. Go to Render dashboard
2. Select your service
3. Click "Logs"

### Check Frontend Errors
1. Open browser DevTools (F12)
2. Check Console tab
3. Check Network tab

### Check MongoDB
1. Go to MongoDB Atlas dashboard
2. Click "Browse Collections"
3. View your data

---

## 🚨 If Something Breaks

| Problem | Quick Fix |
|---------|-----------|
| Port already in use | Kill process or restart computer |
| MongoDB connection refused | Ensure MongoDB service is running |
| 404 errors | Check API URL in frontend .env |
| CORS errors | Check backend CORS settings |
| Deployment failed | Check logs in Vercel/Render |
| Data not saving | Check MongoDB connection string |

---

## 📱 Responsive Design

Your app works on:
- ✅ Desktop (full features)
- ✅ Tablet (responsive layout)
- ✅ Mobile (optimized for touch)

Test with:
```bash
# Browser DevTools
F12 → Toggle Device Toolbar (Ctrl+Shift+M)
```

---

## 🎓 Learning Resources

**If you want to learn more:**
- React: https://react.dev
- Node.js: https://nodejs.org/en/docs
- Express: https://expressjs.com
- MongoDB: https://docs.mongodb.com
- Tailwind CSS: https://tailwindcss.com/docs

---

## ⚡ Pro Tips

1. **Hot Reload:** Both servers auto-reload when you save files
2. **Terminal Tips:** Open multiple terminal windows with `npm run dev` and `npm start`
3. **Testing API:** Use Postman (https://www.postman.com) for API testing
4. **Database Backup:** Export MongoDB collection regularly
5. **Version Control:** Commit often with clear messages

---

## 🎉 Success Checklist

- [ ] MongoDB setup complete
- [ ] Backend running locally
- [ ] Frontend running locally
- [ ] Can book a ride
- [ ] Data shows in MongoDB
- [ ] Code pushed to GitHub
- [ ] Deployed to Vercel + Render
- [ ] Production app working
- [ ] Ready to add features! 🚀

---

**Questions? Check:**
1. SETUP_CHECKLIST.md
2. DEPLOYMENT_GUIDE.md
3. MONGODB_SETUP.md
4. README.md

**Let's go! 🚀**
