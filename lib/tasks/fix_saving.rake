# frozen_string_literal: true# generate data countries

namespace :fix_saving do
  desc 'Fix amount saving'
  task amount: :environment do
    SavingPackage.all.each do |saving_package|
      saving_package.adult_amount = saving_package.adult_amount.to_i
      saving_package.child_amount = saving_package.child_amount.to_i
      saving_package.save
    end
  end
end
