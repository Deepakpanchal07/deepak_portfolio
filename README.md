# Deepak Panchal - Flutter Developer Portfolio

A modern, high-performance developer portfolio built with **Flutter Web and Dart**, inspired by contemporary Awwwards-style engineering aesthetics.

---

## ✨ Features & Highlights

- **Visual Design**: Dark charcoal background (`#0A0C10`), vibrant electric orange accents (`#FF6B35`), subtle gradients, soft glows, and glassmorphic card surfaces.
- **Hero Section**:
  - Live availability badge: *"Open to Opportunities"* with pulsing status glow.
  - Interactive **Floating Code Editor mockup** with syntax-highlighted Dart/Flutter code and animated micro-interactions.
  - Quick action buttons: *"Explore My Projects"* (smooth scroll) & *"Download Resume"*.
  - Direct social connectivity: LinkedIn, GitHub, Email, and Phone.
- **About Me**:
  - Highlights B.Tech in Computer Science & Engineering from Om Sterling Global University (8.07/10 CGPA).
  - 6-Month Flutter Developer Internship at QodeMatrix Tech Solutions (Sept 2025 – Feb 2026).
  - Key focus areas: Cross-platform Flutter apps, Firebase Authentication, Cloud Firestore, UI performance optimization, and clean modular Dart architecture.
- **Technical Skills**:
  - Categorized into Mobile Development, Programming Languages, Backend & Database, State Management, APIs & Integrations, and Tools/Workflow.
  - Authentic display with zero invented proficiency percentages or ratings.
- **Featured Projects**:
  1. **Food Delivery App**: Full-stack food ordering platform (Flutter + Node.js/Express/MongoDB) with menu browsing, authentication, and cart management. Includes a custom interactive mobile mockup preview.
  2. **Easy Shopping – E-Commerce Application**: Cross-platform store with Firebase Authentication, real-time Cloud Firestore synchronization, and Razorpay payment gateway integration. Includes custom shopping preview.
  3. **QR Generator**: Utility application for instant QR code generation and export. Includes custom vector preview.
- **Experience Timeline**:
  - *Flutter Developer Intern* @ QodeMatrix Tech Solutions (Gurugram, Haryana | September 2025 – February 2026).
  - *Software Engineering Job Simulation* @ Skyscanner, Forage (Dropwizard microservices & Android flight itinerary app).
- **Education & Certifications**:
  - B.Tech in CSE (Om Sterling Global University | CGPA: 8.07/10).
  - Class 12 (Shivalik Sr. Sec. School | 70%) & Class 10 (Shaheed Bhagat Singh High School | 89%).
  - Artificial Intelligence Certificate Course (ICT Academy, Infosys Foundation).
  - Six-month Flutter Developer Internship Certificate (QodeMatrix Tech Solutions).
- **Contact Section & Working Form**:
  - Direct contact cards (Email, Phone, Location, LinkedIn, GitHub).
  - Contact form with client-side validation that triggers a pre-filled direct email via the user's default email client, with quick clipboard copy fallbacks.
- **Resume Download**:
  - Direct PDF download/opening handler linked to `assets/resume/Deepak_Panchal_Resume.pdf`.

---

## 📁 Modular Project Structure

```
d:/portfolio/
├── assets/
│   ├── images/                # Optional project screenshots & mockups
│   └── resume/
│       ├── README.md
│       └── Deepak_Panchal_Resume.pdf  # Put your real resume PDF here!
├── lib/
│   ├── main.dart              # Main application entry point & smooth scrolling
│   ├── constants/
│   │   ├── app_colors.dart    # Dark charcoal & #FF6B35 orange palette
│   │   ├── app_theme.dart     # Google Fonts Plus Jakarta Sans typography
│   │   └── breakpoints.dart   # Responsive desktop/tablet/mobile breakpoints
│   ├── data/
│   │   └── portfolio_data.dart # CENTRAL CONFIG FILE: Edit all links & details here!
│   ├── models/
│   │   ├── project_model.dart
│   │   ├── experience_model.dart
│   │   ├── education_model.dart
│   │   ├── certification_model.dart
│   │   └── skill_model.dart
│   ├── sections/
│   │   ├── navbar/            # Desktop NavBar & Mobile Drawer
│   │   ├── hero/              # Hero headline & floating code editor visual
│   │   ├── about/             # Editorial bio & highlight cards
│   │   ├── skills/            # Categorized capability grid
│   │   ├── projects/          # Featured projects & custom mockups
│   │   ├── experience/        # Internship & job simulation cards
│   │   ├── education/         # Academic degrees & certificates
│   │   ├── contact/           # Direct info & working email form
│   │   └── footer/            # Dynamic year, back-to-top, & socials
│   └── widgets/               # Reusable glass cards, animated buttons, badges
├── test/
│   └── widget_test.dart       # Responsive smoke test suite (passes 100%)
└── web/
    └── index.html             # Custom SEO meta tags, fonts, & preload indicator
```

---

## 🛠️ How to Run Locally

### 1. Development Mode (Hot Reload with Chrome)
```bash
flutter run -d chrome
```

### 2. Run with CanvasKit or HTML Renderer
```bash
flutter run -d chrome --web-renderer auto
```

### 3. Run Production Build Locally
```bash
# Build the optimized web bundle
flutter build web --release

# Serve locally using Python
python -m http.server 8090 --directory build/web
```
Now open **http://localhost:8090** in your browser.

---

## 🧪 Testing and Quality Verification

To analyze the codebase for linting and code quality:
```bash
flutter analyze
```
*(Result: 0 issues found)*

To run the automated viewport responsiveness test suite:
```bash
flutter test
```
*(Result: All tests passed on both desktop and mobile viewports)*

---

## 🚀 Deployment Instructions

### Option 1: Deploy on Vercel (Recommended)
1. Push your repository to GitHub.
2. Log in to [Vercel](https://vercel.com) and click **"Add New Project"**.
3. Import your GitHub repository.
4. Set the following build settings:
   - **Framework Preset**: Other
   - **Build Command**: `flutter build web --release`
   - **Output Directory**: `build/web`
5. Click **Deploy**. Vercel provides a custom free domain with automatic SSL and continuous deployment on every Git push.

> *Tip: Alternatively, you can install the Vercel CLI and deploy directly from your machine:*
> ```bash
> flutter build web --release
> npx vercel build/web --prod
> ```

### Option 2: Deploy on GitHub Pages
1. Build the release bundle:
   ```bash
   flutter build web --release --base-href "/YOUR_REPO_NAME/"
   ```
2. Deploy the `build/web` folder to the `gh-pages` branch using the `gh-pages` npm package or Git:
   ```bash
   npx -y gh-pages -d build/web
   ```
3. In your GitHub repository **Settings -> Pages**, select the `gh-pages` branch as the source.

### Option 3: Deploy on Firebase Hosting
1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```
2. Initialize Firebase in the project directory:
   ```bash
   firebase login
   firebase init hosting
   ```
   - When asked for public directory, enter: `build/web`
   - Configure as single-page app: `Yes`
3. Deploy:
   ```bash
   flutter build web --release
   firebase deploy --only hosting
   ```

---

## 📝 Placeholders to Update with Your Real Data

All project content is organized in a single central file:
[`lib/data/portfolio_data.dart`](file:///d:/portfolio/lib/data/portfolio_data.dart).

Here are the specific placeholders you can update anytime:

1. **GitHub Profile URL**:
   - Location: `lib/data/portfolio_data.dart` (line 25)
   - Change `static const String githubUrl = "https://github.com/your-username";` to your real GitHub profile URL.
2. **Resume PDF**:
   - Location: `assets/resume/Deepak_Panchal_Resume.pdf`
   - Place your real PDF in `assets/resume/` using the name `Deepak_Panchal_Resume.pdf` (or customize `PortfolioData.resumePdfPath`).
3. **Project Repositories & Live Demos**:
   - Location: `lib/data/portfolio_data.dart` under `PortfolioData.projects`:
     - **Food Delivery App**: Update `githubUrl` and `liveDemoUrl`.
     - **Easy Shopping App**: Update `githubUrl` and `liveDemoUrl`.
     - **QR Generator**: Update `githubUrl` and `liveDemoUrl`.
4. **Project Screenshots (Optional)**:
   - The portfolio currently renders high-fidelity Flutter interactive UI mockups for each project. If you wish to use actual PNG/JPEG screenshots instead, place them in `assets/images/` and update `previewType` to `ProjectPreviewType.custom` with your image path.
5. **Contact Form Email Destination**:
   - Default destination: `pnchaldeepak82@gmail.com`
   - Confirmed phone: `+91 8816039384`
   - Confirmed LinkedIn: `https://www.linkedin.com/in/deepak-panchal-a0aa41362/`
