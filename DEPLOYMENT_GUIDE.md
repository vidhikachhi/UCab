# 🚀 Swift Cab - Deployment Guide

## Prerequisites
- MongoDB Atlas account (or local MongoDB)
- GitHub repository with your code
- Vercel account (frontend) - **https://vercel.com**
- Render account (backend) - **https://render.com**

---

## **📱 PART 1: Frontend Deployment (Vercel)**

### Step 1: Prepare Your Frontend

1. **Build the frontend:**
   ```bash
   cd frontend
   npm run build
   ```

2. **Verify build is successful** (check `frontend/build` folder exists)

### Step 2: Push Code to GitHub

```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

### Step 3: Deploy on Vercel

1. **Go to:** https://vercel.com/new
2. **Import your GitHub repository:**
   - Click "Import Git Repository"
   - Select your Swift_Cab repository
3. **Configure Build Settings:**
   - Framework: React
   - Root Directory: `./frontend`
   - Build Command: `npm run build`
   - Output Directory: `build`
4. **Environment Variables:**
   - Add key: `REACT_APP_API_URL`
   - Value: `https://your-backend-url.onrender.com/api` (you'll update this after backend deployment)
5. **Click "Deploy"** (takes 2-5 minutes)

### Step 4: Get Your Frontend URL
- After deployment, you'll get a URL like: `https://swift-cab-xyz.vercel.app`
- This is your **Frontend URL**

---

## **⚙️ PART 2: Backend Deployment (Render)**

### Step 1: Prepare Your Backend

1. **Verify package.json has start script:**
   ```json
   "scripts": {
     "dev": "nodemon server.js",
     "start": "node server.js"
   }
   ```

2. **Update backend code (optional for production):**
   ```javascript
   // In server.js - Update CORS for production
   const corsOptions = {
     origin: process.env.FRONTEND_URL || 'http://localhost:3000',
     credentials: true
   };
   app.use(cors(corsOptions));
   ```

### Step 2: Deploy on Render

1. **Go to:** https://render.com
2. **Sign up and click "New +"** → **"Web Service"**
3. **Connect GitHub Repository:**
   - Select your Swift_Cab repo
   - Choose to deploy only the backend folder
4. **Configure Settings:**
   - **Name:** `swift-cab-backend`
   - **Runtime:** Node
   - **Build Command:** `npm install`
   - **Start Command:** `node server.js`
   - **Root Directory:** `backend`
5. **Add Environment Variables:**
   - Key: `MONGO_URI` | Value: `mongodb+srv://admin:PASSWORD@cluster.mongodb.net/swiftcab?retryWrites=true&w=majority`
   - Key: `PORT` | Value: `5000`
   - Key: `NODE_ENV` | Value: `production`
   - Key: `FRONTEND_URL` | Value: `https://your-frontend-url.vercel.app`
6. **Click "Create Web Service"** (takes 5-10 minutes)

### Step 3: Get Your Backend URL
- After deployment:
  - Backend URL: `https://swift-cab-backend-xyz.onrender.com`
  - API URL: `https://swift-cab-backend-xyz.onrender.com/api`

---

## **🔄 PART 3: Update Frontend with Backend URL**

### Step 1: Update Frontend Environment Variables

1. **Go back to Vercel Dashboard**
2. **Select your project** → **Settings** → **Environment Variables**
3. **Update `REACT_APP_API_URL`:**
   - Value: `https://your-backend-url.onrender.com/api`
4. **Trigger Redeploy** (or push new commit to auto-deploy)

### Step 2: Verify Connection

- Visit your Vercel frontend URL
- Try booking a ride
- Check if data is saved in MongoDB Atlas

---

## **🧪 Testing in Production**

### Test Endpoints

```bash
# Test backend API
curl https://your-backend-url.onrender.com/api/bookings

# Should return list of bookings (or empty array)
```

### Verify MongoDB Connection

1. **Go to MongoDB Atlas**
2. **Click "Clusters"** → **"Browse Collections"**
3. **Verify data is being saved** in `swiftcab` → `bookings` collection

---

## **📊 Monitoring & Maintenance**

### View Logs

**Render Backend:**
- Go to Render Dashboard → Select your service
- Click "Logs" tab to view live server logs

**Vercel Frontend:**
- Go to Vercel Dashboard → Select your project
- Click "Analytics" or "Deployments" for logs

### Common Issues

| Issue | Solution |
|-------|----------|
| 502 Bad Gateway | Backend crashed. Check Render logs |
| CORS Error | Update CORS in backend server.js |
| MongoDB Connection Failed | Verify IP allowlisting in MongoDB Atlas |
| Frontend Shows Errors | Check REACT_APP_API_URL in Vercel env vars |

---

## **🔐 Security Checklist Before Production**

- [ ] Never commit `.env` files to GitHub
- [ ] Use strong MongoDB passwords (20+ chars)
- [ ] Enable IP allowlisting in MongoDB Atlas (not 0.0.0.0/0)
- [ ] Use HTTPS everywhere (automatic on Vercel & Render)
- [ ] Add authentication to your API endpoints
- [ ] Rate limit API endpoints
- [ ] Add input validation to all forms
- [ ] Enable MongoDB Atlas M1+ tier for production (not free M0)

---

## **💡 Tips for Success**

1. **Start small:** Deploy to staging first to test
2. **Monitor logs:** Check deployment logs regularly
3. **Keep backups:** Export MongoDB data regularly
4. **Test thoroughly:** Test all features in production
5. **Update dependencies:** Keep packages updated for security

---

## **Alternative Deployment Platforms**

### Backend Alternatives:
- **Heroku** - https://www.heroku.com (free tier ending)
- **Railway** - https://railway.app (good for beginners)
- **Fly.io** - https://fly.io (modern deployment)

### Frontend Alternatives:
- **Netlify** - https://netlify.com (similar to Vercel)
- **GitHub Pages** - Free but limited
- **AWS S3 + CloudFront** - More complex but scalable

### Database Alternatives:
- **MongoDB Atlas** ✅ (Recommended - free & production-ready)
- **AWS DocumentDB** (managed MongoDB service)
- **Azure Cosmos DB** (Microsoft equivalent)

---

## **Next Steps**

1. **Create MongoDB Atlas account** (if not done)
2. **Get MongoDB connection string**
3. **Push code to GitHub**
4. **Deploy frontend on Vercel**
5. **Deploy backend on Render**
6. **Test the live application**

**Need help?** Check logs in Render/Vercel dashboards!
