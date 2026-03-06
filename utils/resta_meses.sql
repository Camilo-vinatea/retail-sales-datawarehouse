CREATE OR REPLACE FUNCTION resta_meses(date1 date, date2 date)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN EXTRACT(YEAR FROM age(date1, date2)) * 12 + EXTRACT(MONTH FROM age(date1, date2));
END;
$$;