# Optimized Resume - Sumitra Sen

This repository contains my professional resume optimized for financial technology positions, with particular emphasis on EasyWay platform expertise and real-time financial systems.

## 🎯 Resume Highlights

- **Financial Technology Specialist** with EasyWay platform expertise
- **Real-time Systems Developer** for post-trade services
- **SWIFT Integration Expert** with security implementation experience
- **Full-stack Developer** specializing in financial applications

## 📁 Repository Structure

```
optimized-resume/
├── resume.tex              # Main LaTeX resume file
├── resume.pdf              # Compiled PDF version
├── README.md               # This file
├── template/               # Template components
│   ├── header.tex         # Professional header template
│   ├── skills.tex         # Technical skills section
│   └── experience.tex     # Experience template
├── .gitignore             # LaTeX build files
└── compile.sh             # Build script
```

## 🔧 How to Compile

### Prerequisites
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- `moderncv` package

### Compilation Steps

1. **Using the build script:**
   ```bash
   chmod +x compile.sh
   ./compile.sh
   ```

2. **Manual compilation:**
   ```bash
   pdflatex resume.tex
   pdflatex resume.tex  # Run twice for proper references
   ```

3. **Online compilation:**
   - Upload `resume.tex` to [Overleaf](https://www.overleaf.com)
   - Compile online without local LaTeX installation

## 🎨 Customization

### Personal Information
Edit the personal data section in `resume.tex`:
```latex
\name{Your}{Name}
\title{Your Title}
\address{Your Address}
\phone[mobile]{Your Phone}
\email{your.email@domain.com}
\social[linkedin]{your-linkedin}
\social[github]{your-github}
```

### Color Themes
Change the resume color by modifying:
```latex
\moderncvcolor{blue}  % Options: blue, orange, green, red, purple, grey, black
```

### Sections
Add or modify sections using:
```latex
\section{Section Name}
\cventry{dates}{position}{company}{location}{}{description}
```

## 🚀 Key Features

- **EasyWay Platform Focus**: Emphasizes Euroclear EasyWay® expertise
- **Quantified Achievements**: Includes specific metrics and improvements
- **ATS-Friendly**: Optimized for Applicant Tracking Systems
- **Professional Layout**: Clean, modern design using LaTeX
- **Mobile-Responsive**: Mentions mobile development experience
- **Security Emphasis**: Highlights authentication and security skills

## 📊 Technical Expertise Highlighted

### Financial Systems
- Euroclear EasyWay® platform
- SWIFT WebAccess integration
- EUCLID system connectivity
- Post-trade services
- Real-time transaction monitoring

### Web Technologies
- Modern JavaScript frameworks
- Responsive design
- RESTful API development
- Browser-based applications
- Mobile-friendly interfaces

### Security & Authentication
- HSM certificate management
- User Access Management (UAM)
- Multi-factor authentication
- End-to-end activity traceability
- Secure API implementations

## 📈 Performance Metrics

The resume includes quantified achievements such as:
- 99.9% system uptime
- 35% reduction in settlement processing time
- 40% increase in user engagement
- 25% performance improvement
- 50% reduction in manual processing time

## 🔗 Quick Links

- **LinkedIn**: [linkedin.com/in/sumitrasencv](https://linkedin.com/in/sumitrasencv)
- **GitHub**: [github.com/SUMISEN98](https://github.com/SUMISEN98)
- **Portfolio**: [Link to your portfolio website]

## 📝 Notes

This resume is specifically optimized for:
- Financial technology roles
- Post-trade services positions
- Real-time systems development
- SWIFT-related opportunities
- Full-stack development in financial services

---

**Last Updated**: July 2025  
**Format**: LaTeX (moderncv banking style)  
**Length**: 2 pages optimized
