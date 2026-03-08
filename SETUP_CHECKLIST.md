# ✅ Swift Cab - Setup & Deployment Checklist

## 🔧 LOCAL DEVELOPMENT SETUP

### Step 1: MongoDB Setup
- [ ] Choose MongoDB option:
  - [ ] Option A: MongoDB Atlas (Cloud - Recommended)
    - [ ] Create account at https://www.mongodb.com/cloud/atlas
    - [ ] Create free shared cluster
    - [ ] Add network access (0.0.0.0/0 for dev, specific IPs for prod)
    - [ ] Create database user (admin / password)
    - [ ] Get connection string
  - [ ] Option B: Local MongoDB
    - [ ] Download from https://www.mongodb.com/try/download/community
    - [ ] Install MongoDB Community Edition
    - [ ] Start MongoDB service: `net start MongoDB`
    - [ ] Verify: `mongod --version`

### Step 2: Backend Setup
- [ ] Navigate to backend folder: `cd swiftcab-fullstack/backend`
- [ ] Install dependencies: `npm install`
- [ ] Create/Update `.env` file with:
  ```
  PORT=5000
  MONGO_URI=<your-mongodb-uri>
  NODE_ENV=development
  ```
- [ ] Start backend: `npm run dev`
- [ ] Verify: Backend should run on http://localhost:5000
- [ ] Test API: Visit http://localhost:5000 in browser

### Step 3: Frontend Setup
- [ ] Navigate to frontend folder: `cd swiftcab-fullstack/frontend`
- [ ] Install dependencies: `npm install`
- [ ] Verify `.env` file has:
  ```
  REACT_APP_API_URL=http://localhost:5000/api
  ```
- [ ] Start frontend: `npm start`
- [ ] Verify: Frontend opens on http://localhost:3000
- [ ] Test: Try creating a booking

### Step 4: Test Full Integration
- [ ] Backend running and connected to MongoDB
- [ ] Frontend running and accessible
- [ ] Can access http://localhost:3000
- [ ] Can create a new booking
- [ ] Can view bookings list
- [ ] Data appears in MongoDB Atlas Collections

---

## 🚀 DEPLOYMENT SETUP

### Step 1: Prepare for GitHub
- [ ] Initialize git (if not already done): `git init`
- [ ] Verify `.gitignore` files exist
- [ ] Check that `.env` files are NOT tracked
- [ ] Add remote: `git remote add origin <your-repo-url>`
- [ ] Push to GitHub: `git push -u origin main`

### Step 2: Frontend Deployment (Vercel)
- [ ] Create Vercel account: https://vercel.com
- [ ] Import GitHub repository
- [ ] Set root directory to: `./frontend`
- [ ] Set build command: `npm run build`
- [ ] Add environment variable:
  - Key: `REACT_APP_API_URL`
  - Value: `https://your-backend.onrender.com/api` (update after backend deploy)
- [ ] Deploy
- [ ] Note frontend URL: `https://...vercel.app`

### Step 3: Backend Deployment (Render)
- [ ] Create Render account: https://render.com
- [ ] Create new Web Service
- [ ] Select your GitHub repository
- [ ] Set root directory to: `backend`
- [ ] Set build command: `npm install`
- [ ] Set start command: `node server.js`
- [ ] Add environment variables:
  - `MONGO_URI`: Your MongoDB Atlas connection string
  - `PORT`: 5000
  - `NODE_ENV`: production
  - `FRONTEND_URL`: Your Vercel frontend URL
- [ ] Deploy
- [ ] Note backend URL: `https://...onrender.com`

### Step 4: Update Frontend with Backend URL
- [ ] Go to Vercel settings
- [ ] Update `REACT_APP_API_URL` with your Render backend URL
- [ ] Trigger redeploy

### Step 5: Test Production
- [ ] Visit your Vercel link
- [ ] Test booking functionality
- [ ] Check MongoDB Atlas for saved data
- [ ] Verify no error in browser console
- [ ] Test on mobile device (responsive design)

---

## 🔐 SECURITY CHECKLIST

### Before Production
- [ ] .env files NOT in GitHub repository
- [ ] MongoDB password is strong (20+ characters)
- [ ] IP allowlisting enabled in MongoDB Atlas (not 0.0.0.0/0 for production)
- [ ] HTTPS enabled (automatic on Vercel & Render)
- [ ] No sensitive data in code
- [ ] API endpoints validate input
- [ ] CORS configured correctly
- [ ] Rate limiting implemented (optional)

### Database Security
- [ ] MongoDB Atlas IP allowlisting is set
- [ ] Strong credentials in .env
- [ ] Regular backups enabled
- [ ] No personal data logged

---

## 📋 USEFUL COMMANDS

### Development
```bash
# Start both servers (from root directory)
# Option 1: Run RUN.bat (Windows)
RUN.bat

# Option 2: Manual (Terminal 1)
cd swiftcab-fullstack/backend && npm run dev

# Option 3: Manual (Terminal 2)
cd swiftcab-fullstack/frontend && npm start
```

### MongoDB
```bash
# Test connection string
mongosh "your-connection-string"

# Start local MongoDB (Windows)
net start MongoDB

# Stop local MongoDB
net stop MongoDB
```

### Git
```bash
# Check git status
git status

# Stage changes
git add .

# Commit changes
git commit -m "Your message"

# Push to GitHub
git push origin main

# View git log
git log --oneline
```

### Deployment
```bash
# Build frontend for production
cd frontend && npm run build

# View Vercel deployments
# Go to: https://vercel.com/dashboard

# View Render logs
# Go to: https://dashboard.render.com
```

---

## 🆘 TROUBLESHOOTING

### MongoDB Connection Issues
- [ ] Check MongoDB is running locally or accessible on Atlas
- [ ] Verify MONGO_URI in .env file
- [ ] Check MongoDB Atlas IP allowlisting
- [ ] Verify database user credentials
- [ ] Check internet connection (for Atlas)

### Backend Not Starting
- [ ] Check Node.js version: `node --version` (should be v14+)
- [ ] Check port 5000 not already in use
- [ ] Check .env file exists with MONGO_URI
- [ ] Check MongoDB connection
- [ ] View error logs in terminal

### Frontend Not Loading
- [ ] Check Node.js version: `node --version` (should be v14+)
- [ ] Check port 3000 not already in use
- [ ] Check .env file has REACT_APP_API_URL
- [ ] Restart `npm start`
- [ ] Clear browser cache (Ctrl+Shift+Delete)

### API Errors in Production
- [ ] Check Render backend logs
- [ ] Verify backend URL in Vercel .env
- [ ] Check MongoDB Atlas connection string
- [ ] Verify IP allowlisting in MongoDB Atlas
- [ ] Check CORS settings in backend

### Deployment Failed
- [ ] Check GitHub integration
- [ ] Verify build logs in Vercel/Render
- [ ] Check environment variables are set
- [ ] Try redeploying manually
- [ ] Check for Node version conflicts

---

## 📚 Helpful Links

- **MongoDB Atlas:** https://www.mongodb.com/cloud/atlas
- **Vercel:** https://vercel.com
- **Render:** https://render.com
- **Node.js:** https://nodejs.org
- **Express:** https://expressjs.com
- **React:** https://react.dev
- **MongoDB Docs:** https://docs.mongodb.com

---

## 📞 Need Help?

1. **Check documentation files:**
   - `MONGODB_SETUP.md` - MongoDB installation guide
   - `DEPLOYMENT_GUIDE.md` - Detailed deployment steps

2. **Common resources:**
   - Read error messages carefully
   - Check browser console for errors
   - Check server terminal for errors
   - View deployment logs in Vercel/Render

3. **Still stuck?**
   - Check GitHub issues
   - Read documentation
   - Check Stack Overflow for similar errors
   - Ask in development communities

---

## ✨ Congratulations!

Once all items are checked, your Swift Cab app should be:
- ✅ Running locally with MongoDB
- ✅ Deployed on Vercel (frontend)
- ✅ Deployed on Render (backend)
- ✅ Production-ready!

**Happy coding! 🚀**
