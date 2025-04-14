-- Criação da tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Criação da tabela Veículo
CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(100),
    marca VARCHAR(100),
    ano_fabricacao INT,
    placa VARCHAR(10),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Criação da tabela Mecânico
CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    especialidade VARCHAR(100)
);

-- Criação da tabela Tabela de Referência de Mão-de-Obra
CREATE TABLE Tabela_mao_de_obra (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao_servico VARCHAR(255),
    valor DECIMAL(10, 2)
);

-- Criação da tabela Ordem de Serviço
CREATE TABLE Ordem_Servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    numero_os VARCHAR(50),
    data_emissao DATE,
    valor_total DECIMAL(10, 2),
    status VARCHAR(20),
    data_conclusao DATE,
    id_cliente INT,
    id_veiculo INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

-- Criação da tabela Serviço
CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2),
    id_mecanico INT,
    id_os INT,
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os)
);

-- Criação da tabela Peça
CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco_unitario_