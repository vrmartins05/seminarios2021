const express = require('express');
const mysql = require('mysql');

const PORT = 9001;
const HOST = '0.0.0.0';

const app = express();

const connection = mysql.createConnection({
    host:'mysql-container',
    user: 'root',
    password: 'seminarios2021',
    database: 'seminarios2021'
});

connection.connect();

app.get('/cursos', function(req, res) {
    connection.query('SELECT * FROM cursos', function(error, results) {
        
        if (error) {
            throw error
        };

        res.send(results.map(item => ({ nome: item.nome, professor: item.professor })));
    });
});

app.listen(PORT, HOST, function() {
    console.log('Listening on porta 9001');
})
