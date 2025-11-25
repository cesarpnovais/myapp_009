CREATE DATABASE petapp;


CREATE DATABASE IF NOT EXISTS petapp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE petapp;

-- Usuários / donos
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  phone VARCHAR(30),
  password VARCHAR(255) NOT NULL,
  address TEXT,
  role ENUM('user','clinic','admin') DEFAULT 'user',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pets
CREATE TABLE pets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  owner_id INT NOT NULL,
  name VARCHAR(120) NOT NULL,
  species VARCHAR(60),
  breed VARCHAR(120),
  sex ENUM('M','F','U') DEFAULT 'U',
  birth_date DATE DEFAULT NULL,
  weight DECIMAL(5,2) DEFAULT NULL,
  size ENUM('pequeno','medio','grande') DEFAULT NULL,
  status ENUM('ativo','disponivel_adocao','adotado','falecido') DEFAULT 'ativo',
  profile_photo VARCHAR(255) DEFAULT NULL,
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Vacinas
CREATE TABLE vaccines (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pet_id INT NOT NULL,
  name VARCHAR(150) NOT NULL,
  applied_date DATE,
  next_date DATE,
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (pet_id) REFERENCES pets(id) ON DELETE CASCADE
);

-- Consultas
CREATE TABLE appointments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pet_id INT NOT NULL,
  clinic_id INT,
  vet_name VARCHAR(150),
  service VARCHAR(150),
  appointment_datetime DATETIME,
  notes TEXT,
  status ENUM('agendada','realizada','cancelada') DEFAULT 'agendada',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (pet_id) REFERENCES pets(id) ON DELETE CASCADE
);

-- Feed simples (rede social)
CREATE TABLE feed_posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  pet_id INT DEFAULT NULL,
  media VARCHAR(255),
  caption TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (pet_id) REFERENCES pets(id) ON DELETE SET NULL
);


Pagina onde ficam os campos  https://www.bcb.gov.br/estabilidadefinanceira/historicocotacoes
Campo data inicial <input type="text" name="DATAINI" maxlength="10" size="12" value="25/10/2025" onkeypress="return formataData(this, event);" id="DATAINI">
Campo data final <input type="text" name="DATAFIM" maxlength="10" size="12" value="24/11/2025" onkeypress="return formataData(this, event);" id="DATAFIM">
Seletor da moeda <select name="ChkMoeda"><option value="61" selected="selected">DOLAR DOS EUA</option><option value="222">EURO</option><option value="177">REAL BRASIL</option></select>
Botão buscar <input type="submit" value="Pesquisar" onclick="limparVazio()" class="botao" title="Pesquisar">
A tabela resultante <tr class="fundoPadraoBClaro2"><td>27/10/2025</td><td>A</td><td>5,3738</td><td>5,3744</td></tr>



