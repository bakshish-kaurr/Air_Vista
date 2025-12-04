# Air Vista: Holistic Aviation Data Manager

Air Vista is a comprehensive SQL Server database project for aviation data management, featuring 8 interconnected tables with sample data, advanced views, stored procedures, functions, triggers, indexes, and cursors for complete flight operations management.

## Database Schema
The system includes these core tables with 10 sample records each:
- **Airports**: Airport details (code, name, city, country, runways, gates)
- **Airlines**: Airline info (code, name, contact details, status)
- **Aircraft**: Aircraft linked to airlines (registration, type, seats, status)
- **Passengers**: Passenger records (personal info, passport, nationality)
- **Flights**: Flight schedules (routes, times, aircraft, status, gates)
- **Bookings**: Booking details (passenger-flight links, seats, pricing, status)
- **Baggage**: Baggage tracking (tags, weights, status per booking)
- **BaggageAudit**: Audit trail for baggage status changes[file:1]

## Key Features

### Views (3 Reporting Views)
- `vwFlightSchedule`: Complete flight schedules with airline, aircraft, and airport details
- `vwBookingDetails`: Passenger bookings with flight routes, seats, and pricing
- `vwRevenueByAirline`: Airline revenue analytics (total/pending revenue, avg booking value)[file:1]

### Stored Procedures (4 Business Operations)
- `spBookFlight`: Creates bookings with auto-generated references
- `spGetFlightStatus`: Flight details with seat availability by number/date
- `spUpdateFlightStatus`: Validates and updates flight status
- `spGenerateRevenueReport`: Detailed revenue by airline, seat class, date range[file:1]

### Functions (2 Scalar Functions)
- `fnCalculateOccupancyRate`: Flight occupancy percentage
- `fnGetPassengerBookingCount`: Passenger's confirmed booking count[file:1]

### Cursors (2 Row Processing)
- `cursorActiveFlights`: Iterates and prints scheduled flights
- `cursorPendingPayments`: Bulk updates pending payments to completed[file:1]

### Indexes (5 Performance Optimized)
- Flights: `DepartureDateTime`, `FlightNumber`
- Bookings: `PassengerID`, `FlightID`
- Passengers: `Email`[file:1]

### Triggers (3 Business Rules)
- `trgUpdateFlightDuration`: Auto-calculates flight duration
- `trgPreventOverbooking`: Blocks bookings when flights are full
- `trgLogBaggageStatusChange`: Audits baggage status changes[file:1]




## Authors
**Bakshish Kaur** & **Subham Harbola**  
*CAP570 Project, 2025*

---

**Complete implementation in `AirVista_CAP570_Project.sql` (600+ lines)** - Ready-to-run with all objects, sample data, and test queries.
