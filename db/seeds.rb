

require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all



doc_spec = ["Généraliste", "Dentiste", "Podologue", "Immunologie", "Androloge", "Gynécologue"]
doc_spec.each { |i| Speciality.create(spec_name: i) }



100.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end


20.times do
  spec = Speciality.order("RANDOM()").limit(1).ids[0]
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Number.number(digits: 5),
    speciality: spec
  )
end



20.times do
  City.create(
    city_name: Faker::Address.city
  )
end


200.times do
  d = Doctor.order("RANDOM()").limit(1).ids[0]
  p = Patient.order("RANDOM()").limit(1).ids[0]
  c = City.order("RANDOM()").limit(1).ids[0]
  Appointment.create(
    doctor_id: d,
    patient_id: p,
    city_id: c,
    date: Faker::Time.between(from: '2021-09-01', to: '2021-11-01')
  )
end
