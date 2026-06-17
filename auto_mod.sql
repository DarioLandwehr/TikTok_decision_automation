-- detections by category and media type for automated detection
COPY (
    SELECT
        count(*) AS total,
        strftime(application_date, '%Y-%m-%d') AS application_date,
        platform_name,
        category,
        automated_detection,
        content_type
    FROM eu_dsa_sor
    WHERE application_date >= DATE '2023-10-01'
      AND application_date <= DATE '2026-05-31'
      AND platform_name = 'TikTok'
    GROUP BY
        application_date,
        platform_name,
        category,
        automated_detection,
        content_type
    ORDER BY
        application_date,
        category
) TO '/tmp/tiktok_automation_det.csv'
WITH (HEADER, DELIMITER ',');


-- detections by category and media type for automated decision
-- detections by category and media type for automated detection
COPY (
    SELECT
        count(*) AS total,
        strftime(application_date, '%Y-%m-%d') AS application_date,
        platform_name,
        category,
        automated_decision,
        content_type
    FROM eu_dsa_sor
    WHERE application_date >= DATE '2023-10-01'
      AND application_date <= DATE '2026-05-31'
      AND platform_name = 'TikTok'
    GROUP BY
        application_date,
        platform_name,
        category,
        automated_decision,
        content_type
    ORDER BY
        application_date,
        category
) TO '/tmp/tiktok_automation_dec.csv'
WITH (HEADER, DELIMITER ',');