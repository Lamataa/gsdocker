CREATE TABLE IF NOT EXISTS telemetry (
  id INT AUTO_INCREMENT PRIMARY KEY,
  energy DECIMAL(5,2) NOT NULL DEFAULT 85.0,
  oxygen DECIMAL(5,2) NOT NULL DEFAULT 92.0,
  temperature DECIMAL(6,2) NOT NULL DEFAULT -20.0,
  communication DECIMAL(5,2) NOT NULL DEFAULT 98.0,
  water DECIMAL(5,2) NOT NULL DEFAULT 76.0,
  robotics DECIMAL(5,2) NOT NULL DEFAULT 88.0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO telemetry (energy, oxygen, temperature, communication, water, robotics)
VALUES (85.0, 92.0, -20.0, 98.0, 76.0, 88.0);