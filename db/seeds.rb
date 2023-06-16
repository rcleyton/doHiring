# Limpar registros existentes
puts 'Limpando registros...'
Recruiter.destroy_all
Applicant.destroy_all

# Gerar dados de exemplo
puts 'Gerando registros...'

# Criando recrutadores
10.times do
  recruiter = Recruiter.create(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  puts "Recrutador criado: #{recruiter.email}"
end

# Gerar perfis de recrutador
puts 'Gerando registros de perfis de recrutador...'

Recruiter.all.each do |recruiter|
  recruiter_profile = RecruiterProfile.create(
    full_name: Faker::Name.name,
    document: Faker::IDNumber.valid,
    phone: Faker::PhoneNumber.phone_number,
    cell_phone: Faker::PhoneNumber.cell_phone,
    sector: Faker::Company.industry,
    number_employee: Faker::Number.between(from: 1, to: 1000),
    recruiter: recruiter
  )
  puts "Perfil de recrutador criado: #{recruiter_profile.full_name} (Recrutador: #{recruiter.email})"
end

puts 'Registros de perfis de recrutador gerados com sucesso!'

# Gerando nível das vagas
puts "Criando nível das vagas..."

vacancy_levels = %w(Estágio Trainee Assistente Junior Pleno Senior Coordenador Gerente Diretor)
vacancy_levels.each do |level|
  vacancy_level = VacancyLevel.create(level: level)
  puts "Nível criado: #{vacancy_level.level}"
end

puts 'Registros dos níveis da vagas gerados com sucesso!'

# Gerar dados de exemplo
puts 'Gerando registros de vagas...'

RecruiterProfile.all.each do |recruiter_profile|
  3.times do
    vacancy = Vacancy.create(
      title: Faker::Job.title,
      description: Faker::Lorem.paragraph,
      working_model: Faker::Job.employment_type,
      salary: Faker::Number.between(from: 2000, to: 5000),
      benefits: Faker::Lorem.sentence,
      location: Faker::Address.city,
      recruiter_profile: recruiter_profile,
      status: 'Ativo',
      vacancy_level: VacancyLevel.all.sample
    )
    puts "Vaga criada: #{vacancy.title} (Recrutador: #{recruiter_profile.full_name})"
  end
end

puts 'Registros de vagas gerados com sucesso!'

# Criando candidatos
20.times do
  applicant = Applicant.create(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  puts "Candidato criado: #{applicant.email}"
end

# seeds.rb

# Gerar dados de exemplo
puts 'Gerando registros de perfis de candidatos...'

Applicant.all.each do |applicant|
  applicant_profile = ApplicantProfile.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    rg: Faker::IDNumber.unique.brazilian_id(formatted: true),
    cpf: Faker::IDNumber.unique.brazilian_citizen_number(formatted: true),
    gender: ['Masculino', 'Feminino', 'Outro'].sample,
    civil_status: ['Solteiro(a)', 'Casado(a)', 'Divorciado(a)', 'Viúvo(a)'].sample,
    professional_goals: Faker::Lorem.sentence,
    applicant: applicant
  )
  puts "Perfil de candidato criado: #{applicant_profile.first_name} #{applicant_profile.last_name} (Candidato: #{applicant.email})"
end

puts 'Registros de perfis de candidatos gerados com sucesso!'
