class CardCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  CARD_NUM = 10  # 同時にユーザーを作成する数
  attr_accessor :collection  # ここに作成したルームモデルが格納される

  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
        Card.new(
          word: value['word'],
          explanation: value['explanation'],
          genre_id: value['genre_id']
        )
      end
    else
      self.collection = CARD_NUM.times.map{ Card.new }
    end
  end

  # レコードが存在するか確認するメソッド
  def persisted?
    false
  end

  def save
    ActiveRecord::Base.transaction do
      collection.each do |result|
        result.save
      end
    end
    rescue
      p 'エラー'
  end


end