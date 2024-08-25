<?php
include_once("basedatos.php");
class personas extends database_connect
{
  private $cedula;
  private $nombres;
  private $apellidos;
  private $direccion;
  private $telefono;
  private $correo;

  function setDatos($cedula, $nombres, $apellidos, $direccion, $telefono, $correo)
  {
    $this->cedula = $cedula;
    $this->nombres = strtoupper($nombres);
    $this->apellidos = strtoupper($apellidos);
    $this->direccion = strtoupper($direccion);
    $this->telefono = $telefono;
    $this->correo = $correo;
  }

  function incluye()
  {
    $sql = "INSERT INTO personas(cedula, nombres, apellidos, direccion, telefono, correo) VALUES(?,?,?,?,?,?)";
    return $this->query($sql, [$this->cedula, $this->nombres, $this->apellidos, $this->direccion, $this->telefono, $this->correo]);
  }

  function modificar($cedulaOriginal)
  {
    $sql = "UPDATE `personas`
              SET `cedula`=?, `nombres`=?, `apellidos`=?, `direccion`=?, `telefono`=?, `correo`=?
              WHERE `cedula`=?";
    return $this->query($sql, [$this->cedula, $this->nombres, $this->apellidos, $this->direccion, $this->telefono, $this->correo, $cedulaOriginal]);
  }
  function verificarCedula($cedula)
  {
    $sql = "SELECT * FROM `personas` WHERE `cedula` = ?";


    $resultado = $this->query($sql, [$cedula]);

    // Verificar si hubo algún resultado
    if ($resultado) {
      // Retorna los datos obtenidos
      return $this->fetch_query($resultado); // Retorna el primer registro encontrado
    } else {
      return false;
    }
  }


  function eliminar($origin)
  {
    $sql =  "
      DELETE FROM `personas` WHERE `cedula` = ?;
      DELETE FROM `login` WHERE `username` = ?
      ";
    return $this->query($sql, [$origin, $origin]);
  }
  function tabla($offset, $limit)
  {
    $sql = "SELECT * from `personas` LIMIT $offset,$limit";
    return $this->fetch_all_query($this->query($sql, ""));
  }
  function TotaldePagina()
  {
    $sql = "SELECT * from `personas`";
    return count($this->fetch_all_query($this->query($sql, "")));
  }

  function nombreColumna()
  {
    $sql = "SHOW COLUMNS FROM `personas`";
    return $this->fetch_all_query($this->query($sql, ""));
  }
  function tablaFiltrada($campo, $valor, $offset, $limit)
  {
    $sql = "SELECT * FROM `personas` WHERE `$campo` LIKE ? LIMIT $offset, $limit";
    return $this->fetch_all_query($this->query($sql, ["%$valor%"]));
  }

  function totalFiltrado($campo, $valor)
  {
    $sql = "SELECT COUNT(*) as total FROM `personas` WHERE `$campo` LIKE ?";
    $resultado = $this->fetch_query($this->query($sql, ["%$valor%"]));
    return $resultado['total'];
  }
}
//Query para El paginado
class query extends personas
{
  function GenerarTabla($offset, $limit)
  {
    return $this->tabla($offset, $limit);
  }
  function TotalPaginas()
  {
    return $this->TotaldePagina();
  }
  function obtenerDatosProfesores()
  {
    $zona = new personas();
    return $zona->tabla(0, 100); // Reemplaza los parámetros por los adecuados
  }

  function GenerarTablaFiltrada($campo, $valor, $offset, $limit)
  {
    return $this->tablaFiltrada($campo, $valor, $offset, $limit);
  }

  function TotalPaginasFiltradas($campo, $valor)
  {
    return $this->totalFiltrado($campo, $valor);
  }
}
