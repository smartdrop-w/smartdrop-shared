# smartdrop-shared

> **SmartDrop - IoT Liquid Monitoring & Quality Management**  
> *UPC - Fundamentos de Arquitectura de Software (2026-20)*  
> *Autor Responsable:* **Angel Jose Pariona Chacca**

---

## Descripcion General

Biblioteca compartida transversal (Shared Kernel) empaquetada como artefacto JAR reutilizable. Contiene el patron Transactional Outbox para publicacion confiable de eventos, configuracion de seguridad base, politicas CORS para aplicaciones cliente y sonda de salud para orquestacion en la nube.

---

## Ejecucion en Entorno Local

Para compilar y ejecutar el proyecto localmente sin preconfiguraciones externas:

``powershell
# Compilacion y arranque con Maven Wrapper
./mvnw spring-boot:run
``

## Informacion de Empaquetado

* **Tipo de Artefacto:** Biblioteca JAR reutilizable (*Shared Kernel*)
* **Dependencias Principales:** Spring Data JPA, Spring Security, Springdoc OpenAPI, Hibernate

---

## Pruebas Automatizadas

Para validar la suite de pruebas unitarias y de integracion:

``powershell
./mvnw test
```