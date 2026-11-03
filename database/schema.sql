CREATE TABLE IF NOT EXISTS usuario (
    cpf VARCHAR(11) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS transacao (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cpf VARCHAR(11) NOT NULL,
    ip VARCHAR(45) NOT NULL,
    localizacao VARCHAR(255),
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) NOT NULL,
    motivo VARCHAR(255),

    CONSTRAINT fk_transacao_usuario
        FOREIGN KEY (cpf)
        REFERENCES usuario(cpf)
);