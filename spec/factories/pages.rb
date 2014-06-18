FactoryGirl.define do
  factory :page do
    body 'Контент'
    factory :transport do
      title 'Трансфер до места отдыха'
      slug :transport
    end
    factory :food do
      title 'Еда и выездное обслуживание'
      slug :food
    end
    factory :rent do
      title 'Сдать дом в аренду'
      slug :rent
    end
    factory :photo do
      title 'Услуги фотографа'
      slug :photo
    end  
  end
end

