class PagesController < ApplicationController

  def home
    @registrations = Registration.all
    @months_registrations = Registration.where("created_at > ?", Time.now.beginning_of_month)
    @todays_registrations = Registration.where("created_at > ?", Time.now.beginning_of_day)
    @camp_off_reg_count = 0
    @camp_revenue = 0

    @registrations.each do |reg|
      @camp_off_reg_count += reg.camp_offerings.count
      @camp_revenue += reg.total
    end

    @coupon_codes_by_count = Array.new
    CouponCode.all.each do |coupon|
      name = coupon.name
      count = 0
      Registration.all.each do |reg|
        if reg.coupon_code && reg.coupon_code.upcase == name
          count += reg.camp_offerings.count
        end
      end
      @coupon_codes_by_count.push({name: name, count: count})
    end
  end

  def faq
  end

  def comparison
  end

  def testimonials
  end
end
