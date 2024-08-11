CREATE TABLE "channels"."index" (
    "id" BIGINT
        GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    "owner-id" BIGINT
        NOT NULL
        CONSTRAINT "channels.index-FK-ownerID" FOREIGN KEY ("owner-id") REFERENCES "users"."accounts" ("id"),
    "title" TEXT
        NOT NULL
        CONSTRAINT "channels.index-logic-lengthTitle" CHECK (length("title") <= 80),
    "description" TEXT
        CONSTRAINT "channels.index-logic-lengthDescription" CHECK (length("description") <= 350),
    "icon-id" BIGINT
        CONSTRAINT "channels.index-FK-iconID" FOREIGN KEY ("icon-id") REFERENCES "files"."index" ("id"),
    "created-at" TIMESTAMP WITHOUT TIME ZONE
        NOT NULL
        DEFAULT TIMEZONE('UTC', now()),
    "enabled" BOOLEAN
        NOT NULL
        DEFAULT TRUE,
    "public" BOOLEAN
        NOT NULL
        DEFAULT FALSE
);
