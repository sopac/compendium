dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "erlang44"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            //url = "jdbc:postgresql://192.168.20.32/compendium_db"
            url = "jdbc:postgresql:compendium_db"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:compendium_db"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:compendium_db"
        }
    }
}
