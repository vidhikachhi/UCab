# MongoDB Setup Guide for Swift Cab

## 🚀 Quick Start - MongoDB Atlas (Recommended)

### Option 1: Cloud Database (MongoDB Atlas) - RECOMMENDED FOR PRODUCTION

1. **Create Account**
   - Visit: https://www.mongodb.com/cloud/atlas/register
   - Sign up with your email

2. **Create Free Cluster**
   - Click "Create a Deployment"
   - Select "Shared Cluster" (Free tier)
   - Choose your region (closest to you)
   - Click "Create Cluster" (wait 5-10 minutes)

3. **Setup Network Access**
   - Go to "Security" → "Network Access"
   - Click "Add IP Address"
   - Select "Allow Access from Anywhere" (0.0.0.0/0)
   - Click "Confirm"

4. **Create Database User**
   - Go to "Security" → "Database Access"
   - Click "Add New Database User"
   - Username: `admin`
   - Password: **Create a strong password and save it!**
   - Click "Add User"

5. **Get Connection String**
   - Go back to "Clusters"
   - Click "Connect" button
   - Select "Drivers" tab
   - Choose "Node.js" version "4.1 or later"
   - Copy the connection string
   - Replace `<password>` with your user password

6. **Update Backend .env File**
   ```
   MONGO_URI=mongodb+srv://admin:<YOUR_PASSWORD>@<CLUSTER_NAME>.mongodb.net/swiftcab?retryWrites=true&w=majority
   ```

---

### Option 2: Local MongoDB Installation (Windows)

If you prefer local installation:

1. **Download MongoDB Community Edition**
   - Visit: https://www.mongodb.com/try/download/community
   - Select: Windows x64, MSI package
   - Version: 7.0.x (latest) or 6.0.x

2. **Install MongoDB**
   - Run the MSI installer
   - Follow the installer wizard
   - Choose "Install MongoD as a Service"
   - Complete installation

3. **Start MongoDB Service**
   ```powershell
   net start MongoDB
   ```

4. **Verify Installation**
   ```powershell
   mongod --version
   ```

5. **Update Backend .env File**
   ```
   MONGO_URI=mongodb://localhost:27017/swiftcab
   PORT=5000
   NODE_ENV=development
   ```

---

## 📁 Environment Configuration

### Backend (.env file location: `backend/.env`)

**For Development (Local MongoDB):**
```
PORT=5000
MONGO_URI=mongodb://localhost:27017/swiftcab
NODE_ENV=development
```

**For Production (MongoDB Atlas):**
```
PORT=5000
MONGO_URI=mongodb+srv://admin:<PASSWORD>@<CLUSTER>.mongodb.net/swiftcab?retryWrites=true&w=majority
NODE_ENV=production
```

### Frontend (.env file location: `frontend/.env`)

```
REACT_APP_API_URL=http://localhost:5000/api
```

For production, update to your deployed backend URL:
```
REACT_APP_API_URL=https://your-backend-domain.com/api
```

---

## 🧪 Test MongoDB Connection

After updating your `.env` file, restart the backend:

1. **Stop the running backend** (Ctrl+C in terminal)
2. **Restart backend:**
   ```bash
   cd backend
   npm run dev
   ```

3. **Check for connection message** (should show connection successful)

---

## 🌐 Deployment Options

### Frontend Deployment (Vercel)
1. Push code to GitHub
2. Connect repository to Vercel
3. Set environment variables
4. Deploy

### Backend Deployment (Render/Heroku)
1. Push code to GitHub
2. Create new Web Service
3. Connect repository
4. Add environment variables (including MongoDB Atlas URI)
5. Deploy

---

## ⚠️ Important Security Notes

- Never commit `.env` files to GitHub (should be in `.gitignore`)
- Keep MongoDB passwords secure
- Use strong passwords (min 12 characters)
- For production, restrict IP access in MongoDB Atlas Network Access
- Enable IP allowlisting instead of "0.0.0.0/0" for production

---

## 🆘 Troubleshooting

### Connection Error: "connect ECONNREFUSED"
- Local MongoDB: Make sure MongoDB service is running (`net start MongoDB`)
- Atlas MongoDB: Check internet connection and IP allowlisting

### "Authentication failed" Error
- Verify username and password in connection string
- Check special characters are URL encoded

### Cluster not appearing
- Wait 5-10 minutes for cluster creation to complete
- Refresh the page

---

## 📚 Useful Commands

```bash
# Test MongoDB connection string
mongosh "your-connection-string-here"

# Check MongoDB logs (Windows)
Get-Content "$env:ProgramData\MongoDB\log\mongod.log" -Tail 50

# Start/Stop MongoDB Service
net start MongoDB
net stop MongoDB
```
