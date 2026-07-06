USE bd_natalia_romerin_cortissoz;

-- CONSULTA 1: Cantidad de órdenes atendidas por técnico
-- Necesidad: Coordinador de soporte - Distribuir mejor la carga de trabajo.

SELECT 
    t.riwi_id_technician AS technician_id,
    t.riwi_full_name AS technician_name,
    COUNT(o.riwi_id_order) AS total_orders_handled
FROM riwi_technicians t
LEFT JOIN riwi_service_orders o ON t.riwi_id_technician = o.riwi_id_technician
GROUP BY t.riwi_id_technician, t.riwi_full_name
ORDER BY total_orders_handled DESC;

-- CONSULTA 2: Historial de servicios realizados por ciudad
-- Necesidad: Gerente regional - Conocer dónde se realizan más servicios técnicos.

SELECT 
    c.riwi_id_city AS city_id,
    c.riwi_city_name AS city_name,
    COUNT(o.riwi_id_order) AS total_services_performed
FROM riwi_cities c
JOIN riwi_service_branches b ON c.riwi_id_city = b.riwi_id_city
JOIN riwi_service_orders o ON b.riwi_id_branch = o.riwi_id_branch
GROUP BY c.riwi_id_city, c.riwi_city_name
ORDER BY total_services_performed DESC;

-- CONSULTA 3: Total de servicios realizados por tipo de servicio
-- Necesidad: Director operativo - Identificar servicios más solicitados.

SELECT 
    st.riwi_id_service_type AS service_type_id,
    st.riwi_service_name AS service_name,
    COUNT(o.riwi_id_order) AS total_requests
FROM riwi_service_types st
LEFT JOIN riwi_service_orders o ON st.riwi_id_service_type = o.riwi_id_service_type
GROUP BY st.riwi_id_service_type, st.riwi_service_name
ORDER BY total_requests DESC;

-- CONSULTA 4: Equipos con mayor cantidad de mantenimientos
-- Necesidad: Analista de soporte - Identificar hardware con mayor falla técnica.

SELECT 
    e.riwi_id_equipment AS equipment_id,
    cat.riwi_category_name AS category,
    e.riwi_equipment_model AS equipment_model,
    COUNT(o.riwi_id_order) AS total_maintenances
FROM riwi_equipment e
JOIN riwi_equipment_categories cat ON e.riwi_id_category = cat.riwi_id_category
JOIN riwi_service_orders o ON e.riwi_id_equipment = o.riwi_id_equipment
GROUP BY e.riwi_id_equipment, cat.riwi_category_name, e.riwi_equipment_model
ORDER BY total_maintenances DESC;

-- CONSULTA 5: Clientes con mayor número de órdenes de servicio
-- Necesidad: Director comercial - Fidelización y cuentas con mayor demanda.

SELECT 
    cust.riwi_id_customer AS customer_id,
    cust.riwi_customer_name AS customer_name,
    COUNT(o.riwi_id_order) AS total_orders_placed,
    SUM(o.riwi_cost) AS total_revenue_generated
FROM riwi_customers cust
JOIN riwi_service_branches b ON cust.riwi_id_customer = b.riwi_id_customer
JOIN riwi_service_orders o ON b.riwi_id_branch = o.riwi_id_branch
GROUP BY cust.riwi_id_customer, cust.riwi_customer_name
ORDER BY total_orders_placed DESC;

-- CONSULTA 6: Cantidad de órdenes gestionadas por sede
-- Necesidad: Gerente de operaciones - Carga operativa para planificar recursos.

SELECT 
    b.riwi_id_branch AS branch_id,
    cust.riwi_customer_name AS client_owner,
    b.riwi_branch_name AS branch_name,
    COUNT(o.riwi_id_order) AS operational_load_orders
FROM riwi_service_branches b
JOIN riwi_customers cust ON b.riwi_id_customer = cust.riwi_id_customer
JOIN riwi_service_orders o ON b.riwi_id_branch = o.riwi_id_branch
GROUP BY b.riwi_id_branch, cust.riwi_customer_name, b.riwi_branch_name
ORDER BY operational_load_orders DESC;
