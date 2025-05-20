## ODBC e ORM em Python

### ODBC (Open Database Connectivity)

ODBC é um padrão que permite que aplicações acessem diferentes sistemas de gerenciamento de banco de dados (SGBDs) de forma independente da linguagem ou do banco utilizado. Ele atua como uma ponte entre o aplicativo e o banco de dados, usando drivers específicos.

Em Python, é possível usar ODBC por meio do módulo `pyodbc`, que permite conectar-se a bancos como SQL Server, MySQL, PostgreSQL, entre outros.

**Exemplo básico com `pyodbc`:**

```python
import pyodbc

conn = pyodbc.connect('DRIVER={SQL Server};SERVER=servidor;DATABASE=banco;UID=usuario;PWD=senha')
cursor = conn.cursor()
cursor.execute('SELECT * FROM tabela')
for row in cursor.fetchall():
    print(row)
```
---

### ORM (Object-Relational Mapping)

ORM é uma técnica que mapeia objetos da aplicação para tabelas do banco de dados, permitindo trabalhar com os dados como se fossem objetos Python, ao invés de usar comandos SQL diretamente.

Em Python, a biblioteca mais comum para ORM é o SQLAlchemy, que oferece uma interface poderosa e flexível.

**Exemplo básico com `SQLAlchemy`:**

```python
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

engine = create_engine('sqlite:///exemplo.db')
Base = declarative_base()

class Usuario(Base):
    __tablename__ = 'usuarios'
    id = Column(Integer, primary_key=True)
    nome = Column(String)

Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)
session = Session()

novo_usuario = Usuario(nome="João")
session.add(novo_usuario)
session.commit()

```
### Utilização de ORM no Django

ORM (Object-Relational Mapping) é uma ferramenta que permite interagir com o banco de dados usando objetos e classes ao invés de comandos SQL diretamente. O Django possui um ORM embutido que facilita essa abstração.

```python
from django.db import models

class Departamento(models.Model):
    sigla = models.CharField(max_length=10, unique=True)
    descricao = models.CharField(max_length=50)

class Funcionario(models.Model):
    nome = models.CharField(max_length=50)
    sexo = models.CharField(max_length=1)
    dtNasc = models.DateField()
    salario = models.DecimalField(max_digits=10, decimal_places=2)
    codSupervisor = models.ForeignKey('self', null=True, blank=True, on_delete=models.SET_NULL, related_name='supervisionados')
    codDepto = models.ForeignKey(Departamento, null=True, blank=True, on_delete=models.SET_NULL)

class Projeto(models.Model):
    nome = models.CharField(max_length=50, unique=True)
    descricao = models.CharField(max_length=250)
    codResponsavel = models.ForeignKey(Funcionario, null=True, blank=True, on_delete=models.SET_NULL, related_name='projetos')
    codDepto = models.ForeignKey(Departamento, null=True, blank=True, on_delete=models.SET_NULL)
    dataInicio = models.DateField()
    dataFim = models.DateField()

class Atividade(models.Model):
    descricao = models.CharField(max_length=250)
    codProjeto = models.ForeignKey(Projeto, null=True, blank=True, on_delete=models.SET_NULL)
    dataInicio = models.DateField()
    dataFim = models.DateField()
```
- [Esquema BD](esquemaBD.sql)
- [Comandos](comandos.sql)
