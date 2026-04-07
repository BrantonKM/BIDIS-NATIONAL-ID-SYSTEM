-- CITIZEN TABLE
CREATE TABLE citizen (
    citizen_id SERIAL PRIMARY KEY,
    nid VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    place_of_birth VARCHAR(100),
    nationality VARCHAR(50) DEFAULT 'Burundian',
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BIRTH REGISTRATION
CREATE TABLE birth_registration (
    birth_id SERIAL PRIMARY KEY,
    citizen_id INT UNIQUE REFERENCES citizen(citizen_id),
    father_id INT REFERENCES citizen(citizen_id),
    mother_id INT REFERENCES citizen(citizen_id),
    birth_date DATE,
    birth_place VARCHAR(100),
    registration_date DATE
);

-- MARRIAGE
CREATE TABLE marriage (
    marriage_id SERIAL PRIMARY KEY,
    spouse1_id INT REFERENCES citizen(citizen_id),
    spouse2_id INT REFERENCES citizen(citizen_id),
    marriage_date DATE,
    marriage_place VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
);

-- DEATH REGISTRATION
CREATE TABLE death_registration (
    death_id SERIAL PRIMARY KEY,
    citizen_id INT UNIQUE REFERENCES citizen(citizen_id),
    death_date DATE,
    cause_of_death VARCHAR(255),
    place_of_death VARCHAR(100),
    registration_date DATE
);

-- BIOMETRICS
CREATE TABLE biometric (
    biometric_id SERIAL PRIMARY KEY,
    citizen_id INT REFERENCES citizen(citizen_id),
    fingerprint_hash TEXT,
    face_hash TEXT,
    iris_hash TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AUDIT LOG
CREATE TABLE audit_log (
    log_id SERIAL PRIMARY KEY,
    user_id INT,
    action VARCHAR(50),
    table_name VARCHAR(50),
    record_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);