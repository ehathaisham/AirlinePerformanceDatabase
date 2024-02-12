-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-12 05:30:51.971

-- tables
-- Table: Aircraft_type
CREATE TABLE Aircraft_type (
    AC_TYPEID int  NOT NULL,
    Manufacturer_ID int  NOT NULL,
    AC_GROUP int  NOT NULL,
    Manufacturer_Manufacturer_ID int  NOT NULL,
    CONSTRAINT Aircraft_type_pk PRIMARY KEY (AC_TYPEID)
);

-- Table: Aircraft_type_Airline
CREATE TABLE Aircraft_type_Airline (
    Aircraft_type_AC_TYPEID int  NOT NULL,
    Airline_Flight_ID int  NOT NULL,
    CONSTRAINT Aircraft_type_Airline_pk PRIMARY KEY (Aircraft_type_AC_TYPEID,Airline_Flight_ID)
);

-- Table: Airline
CREATE TABLE Airline (
    Flight_ID int  NOT NULL,
    Airline varchar(48)  NOT NULL,
    Airport_ID char(3)  NOT NULL,
    AirportFrom char(3)  NOT NULL,
    AirportTo char(3)  NOT NULL,
    IATA_code_airline_IATA_Code_Airline varchar(32)  NOT NULL,
    Country_Country_ID int  NOT NULL,
    CONSTRAINT Airline_pk PRIMARY KEY (Flight_ID)
);

-- Table: Airline_sentiment
CREATE TABLE Airline_sentiment (
    Sentiment_ID int  NOT NULL,
    Sentiment varchar(16)  NOT NULL,
    Airline varchar(48)  NOT NULL,
    CONSTRAINT Airline_sentiment_pk PRIMARY KEY (Sentiment_ID)
);

-- Table: Airport
CREATE TABLE Airport (
    Airport_ID int  NOT NULL,
    Country_ID int  NOT NULL,
    City varchar(32)  NOT NULL,
    Country_Country_ID int  NOT NULL,
    IATA_code_airport_IATA_airport_ID int  NOT NULL,
    CONSTRAINT Airport_pk PRIMARY KEY (Airport_ID)
);

-- Table: Airport_from
CREATE TABLE Airport_from (
    Airport_ID int  NOT NULL,
    Airport_Name varchar(64)  NOT NULL,
    Country_Name varchar(32)  NOT NULL,
    Airline varchar(8)  NOT NULL,
    CONSTRAINT Airport_from_pk PRIMARY KEY (Airport_ID)
);

-- Table: Airport_to
CREATE TABLE Airport_to (
    Airport_ID int  NOT NULL,
    Airport_Name varchar(64)  NOT NULL,
    Country_Name varchar(32)  NOT NULL,
    Airline varchar(8)  NOT NULL,
    CONSTRAINT Airport_to_pk PRIMARY KEY (Airport_ID)
);

-- Table: Baggage
CREATE TABLE Baggage (
    Airline_ID int  NOT NULL,
    Baggage int  NOT NULL,
    Airline int  NOT NULL,
    Airline_Flight_ID int  NOT NULL,
    CONSTRAINT Baggage_pk PRIMARY KEY (Airline)
);

-- Table: Country
CREATE TABLE Country (
    Country_ID int  NOT NULL,
    Country_Name varchar(32)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (Country_ID)
);

-- Table: Flight
CREATE TABLE Flight (
    Airline_ID int  NOT NULL,
    Airline varchar(32)  NOT NULL,
    Country_Name varchar(32)  NOT NULL,
    Airport_to_Airport_ID int  NOT NULL,
    Airport_from_Airport_ID int  NOT NULL,
    Airline_Flight_ID int  NOT NULL,
    CONSTRAINT Flight_pk PRIMARY KEY (Airline_ID)
);

-- Table: GEO_Region
CREATE TABLE GEO_Region (
    GEO_Region_ID int  NOT NULL,
    IATA_Code_Airline varchar(8)  NOT NULL,
    Airline varchar(48)  NOT NULL,
    Airline_Flight_ID int  NOT NULL,
    CONSTRAINT GEO_Region_pk PRIMARY KEY (GEO_Region_ID)
);

-- Table: IATA_code_airline
CREATE TABLE IATA_code_airline (
    IATA_Code_Airline varchar(32)  NOT NULL,
    IATA_Code_Airline_ID int  NOT NULL,
    Airline varchar(32)  NOT NULL,
    CONSTRAINT IATA_code_airline_pk PRIMARY KEY (IATA_Code_Airline)
);

-- Table: IATA_code_airport
CREATE TABLE IATA_code_airport (
    IATA_airport_ID int  NOT NULL,
    Airport_ID int  NOT NULL,
    Country_Name varchar(32)  NOT NULL,
    CONSTRAINT IATA_code_airport_pk PRIMARY KEY (IATA_airport_ID)
);

-- Table: Manufacturer
CREATE TABLE Manufacturer (
    Manufacturer_ID int  NOT NULL,
    SSD_NAME_ID int  NOT NULL,
    Manufacturer varchar(32)  NOT NULL,
    AC_TYPEID int  NOT NULL,
    CONSTRAINT Manufacturer_pk PRIMARY KEY (Manufacturer_ID)
);

-- Table: Tweet_ID
CREATE TABLE Tweet_ID (
    Tweet_ID int  NOT NULL,
    Sentiment varchar(16)  NOT NULL,
    Airline varchar(48)  NOT NULL,
    Airline_Flight_ID int  NOT NULL,
    Airline_sentiment_Sentiment_ID int  NOT NULL,
    CONSTRAINT Tweet_ID_pk PRIMARY KEY (Tweet_ID)
);

-- foreign keys
-- Reference: Aircraft_type_Airline_Aircraft_type (table: Aircraft_type_Airline)
ALTER TABLE Aircraft_type_Airline ADD CONSTRAINT Aircraft_type_Airline_Aircraft_type FOREIGN KEY Aircraft_type_Airline_Aircraft_type (Aircraft_type_AC_TYPEID)
    REFERENCES Aircraft_type (AC_TYPEID);

-- Reference: Aircraft_type_Airline_Airline (table: Aircraft_type_Airline)
ALTER TABLE Aircraft_type_Airline ADD CONSTRAINT Aircraft_type_Airline_Airline FOREIGN KEY Aircraft_type_Airline_Airline (Airline_Flight_ID)
    REFERENCES Airline (Flight_ID);

-- Reference: Aircraft_type_Manufacturer (table: Aircraft_type)
ALTER TABLE Aircraft_type ADD CONSTRAINT Aircraft_type_Manufacturer FOREIGN KEY Aircraft_type_Manufacturer (Manufacturer_Manufacturer_ID)
    REFERENCES Manufacturer (Manufacturer_ID);

-- Reference: Airline_Country (table: Airline)
ALTER TABLE Airline ADD CONSTRAINT Airline_Country FOREIGN KEY Airline_Country (Country_Country_ID)
    REFERENCES Country (Country_ID);

-- Reference: Airline_IATA_code_airline (table: Airline)
ALTER TABLE Airline ADD CONSTRAINT Airline_IATA_code_airline FOREIGN KEY Airline_IATA_code_airline (IATA_code_airline_IATA_Code_Airline)
    REFERENCES IATA_code_airline (IATA_Code_Airline);

-- Reference: Airport_Country (table: Airport)
ALTER TABLE Airport ADD CONSTRAINT Airport_Country FOREIGN KEY Airport_Country (Country_Country_ID)
    REFERENCES Country (Country_ID);

-- Reference: Airport_IATA_code_airport (table: Airport)
ALTER TABLE Airport ADD CONSTRAINT Airport_IATA_code_airport FOREIGN KEY Airport_IATA_code_airport (IATA_code_airport_IATA_airport_ID)
    REFERENCES IATA_code_airport (IATA_airport_ID);

-- Reference: Baggage_Airline (table: Baggage)
ALTER TABLE Baggage ADD CONSTRAINT Baggage_Airline FOREIGN KEY Baggage_Airline (Airline_Flight_ID)
    REFERENCES Airline (Flight_ID);

-- Reference: Flight_Airline (table: Flight)
ALTER TABLE Flight ADD CONSTRAINT Flight_Airline FOREIGN KEY Flight_Airline (Airline_Flight_ID)
    REFERENCES Airline (Flight_ID);

-- Reference: Flight_Airport_from (table: Flight)
ALTER TABLE Flight ADD CONSTRAINT Flight_Airport_from FOREIGN KEY Flight_Airport_from (Airport_from_Airport_ID)
    REFERENCES Airport_from (Airport_ID);

-- Reference: Flight_Airport_to (table: Flight)
ALTER TABLE Flight ADD CONSTRAINT Flight_Airport_to FOREIGN KEY Flight_Airport_to (Airport_to_Airport_ID)
    REFERENCES Airport_to (Airport_ID);

-- Reference: GEO_Region_Airline (table: GEO_Region)
ALTER TABLE GEO_Region ADD CONSTRAINT GEO_Region_Airline FOREIGN KEY GEO_Region_Airline (Airline_Flight_ID)
    REFERENCES Airline (Flight_ID);

-- Reference: Tweet_Airline (table: Tweet_ID)
ALTER TABLE Tweet_ID ADD CONSTRAINT Tweet_Airline FOREIGN KEY Tweet_Airline (Airline_Flight_ID)
    REFERENCES Airline (Flight_ID);

-- Reference: Tweet_ID_Airline_sentiment (table: Tweet_ID)
ALTER TABLE Tweet_ID ADD CONSTRAINT Tweet_ID_Airline_sentiment FOREIGN KEY Tweet_ID_Airline_sentiment (Airline_sentiment_Sentiment_ID)
    REFERENCES Airline_sentiment (Sentiment_ID);

-- End of file.

