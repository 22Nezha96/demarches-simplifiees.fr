class ApiEntreprise::AttestationSocialeAdapter < ApiEntreprise::Adapter
  def initialize(siren, procedure_id)
    @siren = siren
    @procedure_id = procedure_id
  end

  private

  def get_resource
    ApiEntreprise::API.attestation_sociale(@siren, @procedure_id)
  end

  def process_params
    if data_source[:url].present?
      {
        entreprise_attestation_sociale_url: data_source[:url]
      }
    else
      {}
    end
  end
end
