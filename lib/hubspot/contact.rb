module Hubspot
  class Contact
    CREATE_PATH = "/contacts/v1/contact"
    UPDATE_PATH = "/contacts/v1/contact/email/:contact_email/profile"
    CREATE_OR_UPDATE_PATH = "/contacts/v1/contact/createOrUpdate/email/:contact_email"
    BATCH_PATH = "/contacts/v1/contact/batch"
    FIND_PATH = "/contacts/v1/contact/email/:contact_email/profile"

    class << self
      def create(email, args = {})
        args = args.merge(email: email)
        properties = convert_into_properties(args)
        Connection.post(CREATE_PATH, { properties: properties })
      end

      def update(email, args = {}, created = false)
        path = created ? CREATE_OR_UPDATE_PATH : UPDATE_PATH
        path = path.gsub(/(?<=\/):contact_email/, email)
        properties = convert_into_properties(args)
        Connection.post(path, { properties: properties })
      end

      def batch(contacts)
        args = contacts.map do |contact|
          properties = convert_into_properties(contact[:properties])
          { properties: properties, email: contact[:email] }
        end
        Connection.post(BATCH_PATH, args)
      end

      def find(email)
        path = FIND_PATH.gsub(/(?<=\/):contact_email/, email)
        Connection.get(path)
      end

      private

      def convert_into_properties(args)
        args.inject([]) do |results, (key, value)|
          results << { property: key, value: value } and results
        end
      end
    end
  end
end
