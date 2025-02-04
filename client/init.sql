-- Création de la base de données
CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

-- Création de la table des utilisateurs
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table des produits
CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          description TEXT,
                          price DECIMAL(10,2) NOT NULL,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table des factures
CREATE TABLE invoices (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          user_id INT NOT NULL,
                          total DECIMAL(10,2) NOT NULL,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Création de la table des détails de facture
CREATE TABLE invoice_items (
                               id INT AUTO_INCREMENT PRIMARY KEY,
                               invoice_id INT NOT NULL,
                               product_id INT NOT NULL,
                               quantity INT NOT NULL,
                               price DECIMAL(10,2) NOT NULL,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
                               FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Insertion de données factices dans la table users
INSERT INTO users (name, email, password) VALUES
                                              ('Alice Dupont', 'alice@example.com', 'password123'),
                                              ('Bob Martin', 'bob@example.com', 'password456');

-- Insertion de produits factices
INSERT INTO products (name, description, price) VALUES
                                                    ('Ordinateur Portable', 'Un super PC performant', 1200.00),
                                                    ('Souris sans fil', 'Souris ergonomique et sans fil', 30.00),
                                                    ('Clavier mécanique', 'Clavier avec switches mécaniques', 80.00);

-- Création d'une facture pour Alice
INSERT INTO invoices (user_id, total) VALUES (1, 1230.00);

-- Ajout des produits à la facture d'Alice
INSERT INTO invoice_items (invoice_id, product_id, quantity, price) VALUES
                                                                        (1, 1, 1, 1200.00), -- 1 PC portable
                                                                        (1, 2, 1, 30.00);   -- 1 Souris
