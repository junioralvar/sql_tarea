create table if not exists usuarios(
    usuario_id serial primary key,
    username varchar(20) not null unique,
    email varchar(70) not null unique,
    direccion varchar(60) not null,
    password varchar not null
);

create table if not exists posts(
    post_id serial primary key,
    titulo varchar not null,
    contenido text not null,
    fecha_creacion date default current_date,
    usuario_id_fk integer references usuarios(usuario_id)
	on delete cascade
);

create table if not exists comentarios(
	comentario_id serial primary key,
	contenido varchar not null,
	num_reacciones integer null,
	usuario_id_fk integer references usuarios(usuario_id)
	on delete set null,
	post_id_fk integer references posts(post_id)
	on delete set null
);

create table if not exists categorias(
	categoria_id serial primary key,
	nombre varchar(20) not null,
	descripcion varchar (70) null
);

create table if not exists post_categoria (
    post_id_fk integer references posts(post_id) on delete set null,
    categoria_id_fk integer references categorias(categoria_id) on delete set null
);

select * from usuarios;
select * from posts;
select * from comentarios;

delete from usuarios where usuario_id=10;