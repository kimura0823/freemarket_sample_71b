class Deliveryway < ActiveHash::Base
  self.data = [
      {id: 1, day: '選択してください'}, 
      {id: 2, day: '未定'}, 
      {id: 3, day: 'らくらくメルカリ便'}, 
      {id: 4, day: 'ゆうメール'}, 
      {id: 5, day: 'レターパック'}, 
      {id: 6, day: '普通郵便(定形、定形外)'}, 
      {id: 7, day: 'クロネコヤマト'}, 
      {id: 8, day: 'ゆうパック'}, 
      {id: 9, day: 'クリックポスト'}, 
      {id: 10, day: 'ゆうパケット'}
  ]
end