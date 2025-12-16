# Medipol Student Project Hub

A collaborative platform for Medipol University students to share project ideas and form interdisciplinary teams.

## Tech Stack
- **Backend**: Django REST Framework
- **Frontend**: Flutter
- **Database**: MySQL

## Team Members
- Erva Şengül - Backend & API
- Azra Karakaya - Database & API
- Beril Mutlu - Frontend & UI
- Ayşe Çapacı - Frontend & UI

## Setup Instructions

### Backend Setup
```bash
cd backend
python -m venv venv
source venv/bin/activate  # Mac/Linux
# OR
venv\Scripts\activate  # Windows
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

### Frontend Setup
```bash
cd frontend
flutter pub get
flutter run
```

## Project Structure
```
medipol-student-hub/
├── backend/     # Django REST API
├── frontend/    # Flutter Mobile App
└── README.md
```