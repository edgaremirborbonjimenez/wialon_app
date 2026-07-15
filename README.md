# Wialon App

Aplicacion Flutter para consultar el kilometraje actualizado de una unidad registrada en Wialon.

El caso de uso principal es:

> Como encargado de flotilla, quiero ver el kilometraje actualizado a la fecha de un vehiculo en particular.

La unidad objetivo es **Buick Skylark Convertible**. El identificador de la unidad, el token y la URL de la API se configuran por variables de entorno.

## Stack

- Flutter `^3.41.2`
- Dart SDK `>=3.11.0 <4.0.0`
- `flutter_bloc` para gestion de estado
- `dio` para llamadas HTTP
- `get_it` + `injectable` para inyeccion de dependencias
- `envied` para variables de entorno
- `shared_preferences` y `flutter_secure_storage` para persistencia local

## Requisitos

- Tener instalado Flutter 3.41.2.
- Tener un emulador, simulador o dispositivo fisico disponible.
- Contar con las credenciales de prueba de Wialon:
  - `API_URL`
  - `TOKEN`
  - `ITEM_ID`

## Configuracion

1. Clonar el repositorio.

2. Crear el archivo `.env` en la raiz del proyecto tomando como referencia `env.example.txt`:

```env
API_URL=https://hst-api.wialon.com/wialon/ajax.html
TOKEN=token_de_prueba
ITEM_ID=id_de_la_unidad
```

3. Descargar dependencias:

```bash
flutter pub get
```

4. Generar los archivos requeridos por `envied` e `injectable`:

```bash
flutter packages pub run build_runner build
```

Si ya existian archivos generados y el comando reporta conflictos, ejecutar:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Ejecucion

Para correr la aplicacion:

```bash
flutter run
```

## Estructura principal

```text
lib/
  config/
    env/                  Variables de entorno con envied
    routes/               Configuracion de rutas
    theme/                Colores de la app
  src/
    data/                 Servicios remotos, cache local y repositorios
    domain/               Modelos, repositorios abstractos, casos de uso
    presentation/         Pantallas, widgets y BLoC
```