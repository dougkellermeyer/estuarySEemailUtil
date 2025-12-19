
-- Example statement which passes-through source dougKellermeyer/atlas1/sample_mflix/comments documents without modification.
-- Use a WHERE clause to filter, for example: WHERE $my$column = 1234
SELECT JSON($flow_document);

-- Example statement demonstrating how to SELECT specific locations from documents of dougKellermeyer/atlas1/sample_mflix/comments.
-- This statement is effectively disabled by its WHERE FALSE clause and does not emit any documents.
--
-- You can rename a location by using the SQL "AS" syntax, for example:
--   SELECT $some$column AS "my_new_column_name;
--
-- You can also filter by using locations in a WHERE clause, for example:
--   SELECT $some$column WHERE $other$column = 1234;
SELECT
    -- Key _id at /_id
    $_id,
    -- Field _meta at /_meta
    $_meta,
    -- Field _meta/before at /_meta/before; Before Document; Record state immediately before this change was applied. Available if pre-images are enabled for the MongoDB collection.
    $_meta$before,
    -- Field _meta/flow_truncated at /_meta/flow_truncated; Flow truncation indicator; Indicates whether any of the materialized values for this row have been truncated to make them fit inside the limitations of the destination system.
    $_meta$flow_truncated,
    -- Field _meta/inferredSchemaIsNotAvailable at /_meta/inferredSchemaIsNotAvailable; An inferred schema is not yet available because no documents have been written to this collection. This place-holder causes document validations to fail at read time, so that the task can be updated once an inferred schema is ready.
    $_meta$inferredSchemaIsNotAvailable,
    -- Field _meta/op at /_meta/op; Change Operation; Change operation type: 'c' Create/Insert 'u' Update 'd' Delete.
    $_meta$op,
    -- Field _meta/source at /_meta/source; Source; Document source metadata.
    $_meta$source,
    -- Field _meta/source/collection at /_meta/source/collection; Name of the source MongoDB collection.
    $_meta$source$collection,
    -- Field _meta/source/db at /_meta/source/db; Name of the source MongoDB database.
    $_meta$source$db,
    -- Field _meta/source/snapshot at /_meta/source/snapshot; Snapshot is true if the record was produced from an initial backfill and unset if produced from the change stream.
    $_meta$source$snapshot,
    -- Field flow_published_at at /_meta/uuid; Flow Publication Time; Flow publication date-time of this document
    $flow_published_at
-- Disable this statement, so that it emits no documents.
WHERE FALSE;
