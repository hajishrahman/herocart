# HEROCART MASTER ENGINEERING PROMPT

# Flutter + Firebase + Gemini AI Commerce Application

# Use this file as the permanent project instruction reference for Cursor, Copilot, Gemini, ChatGPT, or any AI coding assistant.

---

## PROJECT OVERVIEW

Project Name:
HeroCart

Project Type:
Flutter Android E-Commerce Application

Target Audience:
Parents shopping for boys aged 0–19 years.

Primary Goal:
Build a professional, scalable, cleanly architected mobile commerce application that satisfies all academic DOD requirements while maintaining real-world usability and modern engineering practices.

Project Quality Goal:
Balanced Quality

* Professional architecture
* Clean UI
* Stable implementation
* Complete DOD coverage
* Real integrations
* Avoid unnecessary overengineering

---

## CORE TECHNOLOGY STACK

Frontend:

* Flutter

Language:

* Dart

State Management:

* Provider

Backend:

* Firebase

Firebase Services:

* Firebase Authentication
* Cloud Firestore
* Firebase Storage

Authentication:

* Email/Password
* Google Sign-In

AI Integration:

* Google Gemini API

Payment Gateway:

* Razorpay Test Mode Integration

Platform Target:

* Android APK only

IDE:

* VS Code

Emulator:

* Pixel 6 Android 14

Version Control:

* Git + GitHub

---

## PROJECT DESIGN DIRECTION

UI Style:
FirstCry-inspired modern commerce design.

Design Requirements:

* Parent-friendly UI
* Bright but controlled colors
* Clean spacing
* Rounded modern cards
* Easy navigation
* Fast product discovery
* Mobile-first layout
* Professional but approachable interface

DO NOT:

* Use cluttered layouts
* Use inconsistent button styles
* Use random fonts
* Use more than 2 primary colors
* Mix different design systems
* Generate generic “Amazon clone” UI

---

## CORE FEATURES

MANDATORY FEATURES:

1. Authentication

* Email/password signup
* Email/password login
* Google Sign-In
* Persistent login session
* Logout functionality

2. Home Screen

* Promotional banners
* Search bar
* Age category chips
* Trending products
* Sports products
* Indoor activity products
* Sale section
* Bottom navigation

3. Age Categories
   Required:

* 0-1
* 2-5
* 5-10
* 10-15
* 15-19

4. Product System
   Each product must include:

* Name
* Description
* Price
* Discount price
* Rating
* Review count
* Category
* Age group
* Stock count
* Product images
* Sale status

5. Product Details Screen

* Multiple images
* Description
* Ratings
* Reviews
* Stock status
* Related products
* Add to cart
* Buy now

6. Search & Filtering
   Required filters:

* Price
* Rating
* On sale
* Age category

Sorting:

* Popularity
* Newest
* Price low-high
* Price high-low

7. Wishlist

* Add/remove wishlist items
* Persistent Firebase storage

8. Cart System

* Add/remove products
* Quantity updates
* Cart total calculation

9. Checkout System

* Address form
* Order summary
* Payment method selection
* Razorpay test payment

10. Reviews & Ratings

* Star rating system
* Text reviews
* Review submission after purchase

11. AI Assistant
    Dedicated screen only.

Features:

* Gemini AI integration
* Shopping recommendations
* Product suggestions
* Age-based recommendations
* Sports vs indoor interest suggestions

12. Inventory Management
    Required minimum implementation:

* stock field in Firestore
* decrement stock after order
* show Out of Stock UI
* disable Add to Cart if stock = 0

13. Profile Screen

* User details
* Order history placeholder
* Wishlist shortcut
* Logout

---

## NON-FUNCTIONAL REQUIREMENTS

Application must be:

* Responsive
* Maintainable
* Scalable
* Cleanly architected
* Modular
* Readable

Avoid:

* Massive widget files
* Business logic inside UI
* Duplicate code
* Hardcoded values
* Unstructured Firebase calls

---

## FOLDER STRUCTURE

Use EXACTLY this structure:

lib/
│
├── main.dart
├── firebase_options.dart
│
├── models/
│   ├── product_model.dart
│   ├── user_model.dart
│   ├── cart_model.dart
│   ├── review_model.dart
│   └── order_model.dart
│
├── providers/
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   ├── wishlist_provider.dart
│   ├── product_provider.dart
│   ├── review_provider.dart
│   └── ai_provider.dart
│
├── services/
│   ├── firebase_service.dart
│   ├── auth_service.dart
│   ├── razorpay_service.dart
│   ├── gemini_service.dart
│   └── storage_service.dart
│
├── screens/
│   ├── auth/
│   ├── home/
│   ├── product/
│   ├── cart/
│   ├── wishlist/
│   ├── checkout/
│   ├── profile/
│   ├── ai_assistant/
│   └── search/
│
├── widgets/
│   ├── product_card.dart
│   ├── custom_button.dart
│   ├── category_chip.dart
│   ├── rating_widget.dart
│   └── loading_widget.dart
│
├── constants/
│   ├── app_colors.dart
│   ├── app_text.dart
│   └── app_styles.dart
│
└── utils/
├── validators.dart
└── helpers.dart

---

## STATE MANAGEMENT RULES

Use Provider correctly.

Rules:

* UI should NOT directly handle Firebase business logic.
* Providers manage app state.
* Services handle Firebase/API communication.
* Models define data structure.

Flow:
UI → Provider → Service → Firebase/API

NEVER:

* Put API calls directly inside widgets
* Put large logic inside build methods
* Use setState for global app state

---

## FIRESTORE DATABASE STRUCTURE

collections/

users/
products/
reviews/
orders/
wishlists/

Example Product Document:

{
"name": "Football Shoes",
"price": 1999,
"discountPrice": 1499,
"rating": 4.5,
"stock": 10,
"category": "Sports",
"ageGroup": "10-15",
"isOnSale": true,
"imageUrls": [], // Firebase Storage download URLs
"description": ""
}

---

## GEMINI AI INTEGRATION RULES

Use Gemini API for:

* Product recommendations
* Shopping assistance
* Age-based suggestions

DO NOT:

* Overengineer AI memory systems
* Build custom AI backend
* Build streaming AI infrastructure

Keep implementation simple and reliable.

AI Assistant Prompt Style:

* Friendly
* Helpful
* Parent-oriented
* Commerce-focused

---

## RAZORPAY INTEGRATION RULES

Use:

* Razorpay test mode only

Requirements:

* Successful payment callback
* Save order to Firestore after payment success
* Show payment success/failure states

DO NOT:

* Fake payment success without integration
* Skip order saving after payment

---

## GIT WORKFLOW RULES

Commit frequently and professionally.

MANDATORY COMMIT TIMES:

1. After project initialization
2. After Firebase setup
3. After authentication completion
4. After each completed screen
5. After each major feature
6. After fixing major bugs
7. Before refactoring
8. After successful Razorpay integration
9. After Gemini AI integration
10. Before experimental changes
11. Before merging large UI updates

Commit Message Examples:

* setup firebase authentication
* add wishlist provider
* complete home screen ui
* integrate razorpay test payment
* fix cart quantity update bug

DO NOT:

* Commit broken builds
* Commit random temporary files
* Commit huge unrelated changes together

---

## DEVELOPMENT PRIORITY ORDER

Build in THIS order:

PHASE 1

* Flutter setup
* Firebase setup
* Folder structure
* GitHub repo
* Providers setup

PHASE 2

* Authentication
* Home screen
* Navigation structure

PHASE 3

* Product system
* Search/filter
* Wishlist
* Cart

PHASE 4

* Checkout
* Razorpay integration
* Reviews & ratings

PHASE 5

* Gemini AI assistant
* Inventory management
* Final polish

PHASE 6

* Bug fixing
* UI consistency
* APK generation

---

## FIGMA RULES

Before coding:

* Finalize complete UI in Figma
* Use reusable components
* Maintain spacing consistency
* Maintain color consistency
* Use consistent button radius
* Design mobile-first only

DO NOT:

* Start coding random UI without finalized design direction

---

## PERFORMANCE RULES

* Use const widgets where possible
* Avoid unnecessary rebuilds
* Optimize Firestore reads
* Paginate large product lists later if needed
* Compress large images

---

## ANTI-SPAGHETTI RULES

NEVER:

* Put 500+ lines in one widget file
* Mix UI and backend logic
* Duplicate widgets repeatedly
* Use random Firebase queries everywhere
* Hardcode colors repeatedly
* Hardcode dimensions repeatedly



## APP STORE PREPARATION

Required Deliverables:

* Adaptive Android app icon
* Legacy Android app icon
* Splash screen with HeroCart logo
* Professional launcher branding
* Proper package name:
  com.herocart.app
  (replace if needed)

APK Requirements:

* Generate signed release APK
* Do NOT submit debug APK
* Test release APK before submission

Documentation Requirements:

* Document APK build process
* Document Firebase setup steps
* Document Gemini API integration
* Document Razorpay integration
* Include screenshots in project report

Privacy & Security:

* Add privacy policy URL placeholder
* Do not expose API keys publicly
* Remove debug logs before release

Release Checklist:

* Test authentication
* Test payment flow
* Test Gemini assistant
* Test image loading
* Test search/filter
* Test stock updates
* Test review submission
* Test Google Sign-In

---

## GEMINI AI INTEGRATION DETAILS

Gemini Package:

* Use google_generative_ai package

API Key Security:

* Store API key in .env
  OR
* Store using Firebase Remote Config

NEVER:

* Hardcode API keys directly in source code
* Push API keys to GitHub

Assistant Context Prompt:
"You are a helpful shopping assistant for parents buying products for boys aged 0-19. Suggest products based on age group, interests, and shopping preferences."

AI Input:

* User question
* Selected child age group
* Preference type:
  Sports
  Indoor
  Casual
  Study
  Fashion

AI Output Rules:

* Keep responses under 200 words
* Mobile-friendly formatting
* Show recommendations as product cards
* Avoid long paragraphs
* Keep tone helpful and simple

AI Features:

* Product suggestions
* Gift suggestions
* Sports recommendations
* Indoor activity recommendations
* Age-based shopping assistance

AI Architecture Rules:

* Keep AI implementation lightweight
* No custom AI backend required
* No conversation memory system required
* No chat history storage required

---

## REVIEW DOCUMENT STRUCTURE

Example Review Document:

{
"productId": "abc123",
"userId": "user456",
"userName": "Rahul",
"rating": 4,
"reviewText": "Good quality football",
"createdAt": timestamp
}

Review Requirements:

* One user can submit multiple reviews for different products
* Ratings must be between 1–5
* Review text validation required
* Reviews displayed under product detail page
* Show average rating dynamically
* Show total review count dynamically


## TESTING RULES

Before considering a feature complete:

* Test navigation
* Test Firebase writes
* Test Firebase reads
* Test validation
* Test empty states
* Test loading states
* Test payment flow
* Test stock decrement

---
---

## PROJECT MAINTENANCE RULES

This document is the primary engineering reference for the HeroCart project.

Update this document ONLY when:

* Architecture changes
* Firebase schema changes
* Major features are added
* API decisions change
* Folder structure changes
* UI system changes
* Important known bugs appear
* Deployment requirements change

DO NOT update this document for:

* Minor UI tweaks
* Small bug fixes
* Tiny styling edits
* Experimental temporary changes

Treat this file as the project's engineering constitution and long-term architectural reference.

Optional Maintenance Sections:

* Completed Features
* Current Sprint Tasks
* Known Issues
* API Notes
* Firebase Schema Updates
* Deployment Notes

When in doubt, this document overrides any conflicting instructions.
## FINAL DELIVERY REQUIREMENTS

Final project must:

* Run without crashes
* Have clean navigation
* Use real Firebase integration
* Use real Razorpay test integration
* Include Gemini AI assistant
* Include inventory management
* Include reviews & ratings
* Include search & filtering
* Include Provider architecture
* Follow clean folder structure

The application should look and behave like a real commerce product rather than a basic student CRUD project.

END OF MASTER PROMPT
