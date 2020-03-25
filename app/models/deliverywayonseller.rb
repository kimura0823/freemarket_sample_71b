class Deliverywayonseller < ActiveHash::Base
  self.data = [
      {id: 1, way: '選択してください'}, 
      {id: 2, way: '未定'}, 
      {id: 3, way: 'らくらくメルカリ便'}, 
      {id: 4, way: 'ゆうメール'}, 
      {id: 5, way: 'レターパック'}, 
      {id: 6, way: '普通郵便(定形、定形外)'}, 
      {id: 7, way: 'クロネコヤマト'}, 
      {id: 8, way: 'ゆうパック'}, 
      {id: 9, way: 'クリックポスト'}, 
      {id: 10, way: 'ゆうパケット'}
  ]
end
