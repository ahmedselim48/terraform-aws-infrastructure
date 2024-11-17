provider "aws" {
  region = "us-east-1"  # Specify your preferred region
}

resource "aws_instance" "backend" {
  ami           = "ami-0866a3c8686eaeeba"  
  instance_type = "t2.micro"  

  tags = {
    Name = "BackendMachine"
  }

  root_block_device {
    volume_size = 8
  }

  associate_public_ip_address = true
}

resource "aws_instance" "frontend" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"

  tags = {
    Name = "FrontendMachine"
  }

  root_block_device {
    volume_size = 8
  }

  associate_public_ip_address = true
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.39"  
  instance_class       = "db.t3.micro"  
  db_name              = "mydb"
  username             = "admin"
  password             = "123456789"  
  publicly_accessible  = false

  tags = {
    Name = "MySQLDatabase"
  }
}


output "backend_public_ip" {
  value = aws_instance.backend.public_ip
}

output "frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}
