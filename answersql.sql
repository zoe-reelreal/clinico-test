-- Step 1: Create a numbers table to generate sequences
WITH RECURSIVE numbers AS (
    SELECT 0 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 88  -- 使用 88 以涵盖最大的范围
),

-- Step 2: Generate all possible invoice numbers within the specified ranges
all_possible_invoices AS (
    SELECT 
        ib.id,
        CONCAT(ib.track, '-', LPAD(ib.begin_number + n, 8, '0')) AS invoice_number,
        ib.track,
        ib.year,
        ib.month,
        ib.begin_number,
        ib.end_number
    FROM 
        invoice_books ib
    JOIN 
        numbers 
    ON 
        n <= (ib.end_number - ib.begin_number)
),

-- Step 3: Identify which invoice numbers are not present in the invoices table
unissued_invoices AS (
    SELECT 
        api.id,
        api.invoice_number,
        api.track,
        api.year,
        api.month,
        api.begin_number,
        api.end_number
    FROM 
        all_possible_invoices api
    LEFT JOIN 
        invoices i 
    ON 
        api.invoice_number = i.invoice_number
    WHERE 
        i.invoice_number IS NULL
    AND 
        (api.track != 'AC' OR api.invoice_number <= 'AC-45678988')
)

-- Step 4: Select the results
SELECT 
    id,
    invoice_number,
    track,
    year,
    month,
    begin_number,
    end_number
FROM 
    unissued_invoices
ORDER BY 
    track, 
    invoice_number;
