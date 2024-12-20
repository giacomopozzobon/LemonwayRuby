# ************
# https://documentation.lemonway.com/reference/accounts_documentsuploadpost
# 
# Description: Upload documents to verify a user's KYC (Know Your Customer) status. This is a regulatory obligation for payment institutions.
# European Directive 2015/849 requires KYC to prevent money laundering and terrorist financing.
# 
# @param account_id [String] The unique identifier for the wallet (payment account).
# @param buffer [String] The file buffer containing the document to upload. Byte array with the document. Encode in base 64 if necessary.
# @param type [Int] The type of the file (JPG, JPEG, PNG, or PDF). Only ID documentation (passport, driving licence, residence permit) is accepted.
# @param name [String] The name of the document file being uploaded.
# 
# Important Guidelines:
# - Use JPG, JPEG, PNG, or PDF (maximum 2 pages) for ID documentation.
# - The file size must be between 100KB and 4MB for automatic verification. Documents over 4MB up to 10MB will be manually validated.
# - Full Colour, and straightened file is required.
# - For Card ID: Scan both sides in one file (maximum 2 pages).
# - TIFF format is not accepted.
#
# Document Type:
# (Note) If you have previously uploaded a document in a reserved slot(0-13) and need to upload another document of the same type, use the slot Other document(6, 14-20).
# 0 = ID card (both sides in one file).
# 1 = Proof of address.
# 2 = Scan of a proof of IBAN.
# 3 = Passport (European Union).
# 4 = Passport (outside the European Union).
# 5 = Residence permit (both sides in one file).
# 6 = Other document type.
# 7 = Official company registration document (Kbis extract or equivalent).
# 11 = Driver licence (both sides in one file).
# 12 = Status.
# 13 = Selfie.
# 14 = Other document type.
# 15 = Other document type.
# 16 = Other document type.
# 17 = Other document type.
# 18 = Other document type.
# 19 = Other document type.
# 20 = Other document type.
# 21 = SDD mandate.
# 
# Note:
# - If a document is rejected, the same slot can be used to upload a new file.
# 
# For more details, please refer to the full documentation.
# ************

module LemonwayRuby
  module Accounts
    module AccountId
      module Documents
        module Upload
          extend Helpers

          class << self
            def upload_file(account_id, hash = {})
              required_keys = %i[buffer type name]
              params = ensure_keys(hash, required_keys)
              LemonwayRuby.post(generate_uri.gsub!("accountid", account_id.to_s), params)
            end
          end
        end
      end
    end
  end
end
