-- ==========================================================================
--  AGREGADO AL ESQUEMA — CONTRASEÑA DEL PANEL DE ADMINISTRACIÓN
--  Archivo: 03b_SQL_ADMIN.sql
--  Correr DESPUÉS de 03_ESQUEMA_BD.sql, en el SQL Editor de Supabase.
-- ==========================================================================
--
--  QUÉ HACE Y POR QUÉ
--
--  El esquema original no tiene tabla de administradores. En vez de crear una
--  tabla nueva (que obligaría a tocar el esquema y a rehacer las políticas),
--  aprovechamos la tabla "configuracion", que justamente existe para guardar
--  parámetros sueltos como clave/valor.
--
--  Es una sola fila más. No modifica ninguna tabla ni ninguna columna, así que
--  no rompe nada de lo que ya está andando en socios.html.
--
--  OJO: la contraseña queda en texto plano, igual que la de los socios. Es el
--  mismo nivel de seguridad que ya tienen los proyectos anteriores. Está
--  anotado en 07_QA_PENDIENTES.md para endurecer antes de producción real.
-- ==========================================================================

insert into configuracion (clave, valor, descripcion) values
  ('admin_password', 'admin', 'Contraseña para entrar al panel de administración. Cambiala desde Configuración.')
on conflict (clave) do nothing;

-- Verificación: tienen que aparecer 7 filas de configuración.
select clave, valor, descripcion from configuracion order by id;
