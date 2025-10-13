package com.medconnect.medconnect.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DatabaseManager {

    // This creates the factory only once when the class is loaded
    private static final EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");

    // Simple method to get a new EntityManager
    public static EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

    // Method to close the factory when application stops
    public static void closeFactory() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}
