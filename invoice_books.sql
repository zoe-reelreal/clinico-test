CREATE TABLE invoice_books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    track VARCHAR(2) NOT NULL,
    begin_number INT NOT NULL,
    end_number INT NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO invoice_books (id, track, begin_number, end_number, year, month, created_at, updated_at) VALUES
(1, 'AA', 12345600, 12345649, 113, 03, '2024-03-01 00:00:00', '2024-03-10 12:00:00'),
(2, 'AB', 98765400, 98765449, 113, 03, '2024-03-01 00:00:00', '2024-03-15 12:00:00'),
(3, 'AC', 45678900, 45678999, 113, 03, '2024-03-01 00:00:00', '2024-03-20 12:00:00');
