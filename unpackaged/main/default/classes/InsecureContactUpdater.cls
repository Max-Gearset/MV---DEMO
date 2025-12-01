public with sharing class InsecureContactUpdater {

    public static void updateContactPhoneNumber(Id contactId, String newPhoneNumber) {
        // Find the Contact record.
        Contact contactToUpdate = [
            SELECT Id, Phone
            FROM Contact
            WHERE Id = :contactId
        ];

        // The developer has not explicitly checked for FLS or CRUD permissions here.
        // This code will bypass the running user's permissions.
        contactToUpdate.Phone = newPhoneNumber;

        // The DML operation will try to update the record regardless of permissions.
        update contactToUpdate;
    }
}