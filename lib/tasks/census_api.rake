namespace :census_api do
  desc 'Checks the given credentials against the census_api: [:document_type, :id_document, :birthdate]'
  task :check, [:org_id, :document_type, :id_document, :birthdate] => :environment do |_task, args|
    organization= Decidim::Organization.find(args.org_id)
    document_type= args.document_type
    id_document= args.id_document
    birthdate= DateTime.strptime(args.birthdate, "%Y/%m/%d")

    service= DibaCensusApiRq.new(api_config(organization))
    rs= service.send(
      birthdate: birthdate,
      document_type: document_type_code(document_type),
      id_document: id_document
    )
    puts "RS: #{rs.body}"
    puts "Extracted RS: #{parse_response(rs)}"
  end

  def document_type_code(document_type)
    case document_type&.to_sym
    when :dni
      '01'
    when :passport
      '02'
    when :nie
      '03'
    end
  end

  def api_config(organization)
    { ine: organization.diba_census_api_ine,
      username: organization.diba_census_api_username,
      password: organization.diba_census_api_password }
  end

  def parse_response(response)
    # The *real* response data is encoded as a xml string inside a xml node.
    parsed = Nokogiri::XML(response.body).remove_namespaces!
    Nokogiri::XML(parsed.xpath('//servicioResponse')[0])
  end
end
