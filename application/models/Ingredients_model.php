<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ingredients_model extends CI_Model
{

    /**
     * CONSTRUCTOR | LOAD DB
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * SHOW | GET method.
     *
     * @return Response
     */
    public function show($id = 0)
    {
        if (!empty($id)) {
            $cek = $this->db->get_where("ingredients", ['product_id' => $id])->num_rows();
            if ($cek > 0) {
                $data = $this->db->get_where("ingredients", ['product_id' => $id])->result();
                $query = [
                    'status' => true,
                    'data' => $data
                ];
            } else {
                $query = [
                    'status' => false,
                ];
            }
        } else {
            $data1 = $this->db->get("ingredients")->result();
            $query = [
                'status' => true,
                'data' => $data1
            ];
        }
        return $query;
    }

    /**
     * INSERT | POST method.
     *
     * @return Response
     */
    public function insertIngredients($data, $id)
    {
        $cek = $this->validateProduct($id);
        $ingredientsProduct = $this->productIngredients($id);
        if ($cek > 0) {
            if($ingredientsProduct > 0){
                $this->db->delete('ingredients', array('product_id' => $id));
                $return = $this->db->insert_batch('ingredients', $data);
                $return = [
                    'status' => true,
                    'message' => 'Sukses menambahkan data.'
                ];
            }else{
                $return = $this->db->insert_batch('ingredients', $data);
                $return = [
                    'status' => true,
                    'message' => 'Sukses menambahkan data.'
                ];
            }
        } else {
            $return = [
                'status' => false,
                'message' => 'ID Product tidak ditemukan atau salah.'
            ];
        }
        return $return;
    }

    public function validateProduct($id)
    {
        $return = $this->db->get_where("products", ['product_id' => $id])->num_rows();
        return $return;
    }
    
    public function productIngredients($id)
    {
        $return = $this->db->get_where("ingredients", ['product_id' => $id])->num_rows();
        return $return;
    }
    // public function insertIngredients($data)
    // {
    //     $cek = $this->validateCategory($data['category_id']);
    //     if($cek > 0){
    //         $return = $this->db->insert('products',$data);
    //         $id = $this->db->insert_id();
    //         $return =[
    //             'status' => true,
    //             'message' => 'Sukses menambahkan data.',
    //             'id' => $id
    //         ];
    //     }else{
    //         $return=[
    //             'status' => false,
    //             'message' => 'ID Category tidak ditemukan atau salah.'
    //         ];
    //     }
    //     return $return;
    // } 

    /**
     * UPDATE | PUT method.
     *
     * @return Response
     */
    public function update($data, $id)
    {
        $cek = $this->db->get_where("products", ['product_id' => $id])->num_rows();
        // var_dump($cek);die;
        if ($cek > 0) {
            $cek = $this->validateCategory($data['category_id']);
            if ($cek > 0) {
                $return = $this->db->update('products', $data, array('product_id' => $id));
                $validasi = $this->db->affected_rows();
                if ($validasi > 0) {
                    $return = [
                        'status' => true,
                        'message' => 'Sukses update data.'
                    ];
                } else {
                    $return = [
                        'status' => false,
                        'message' => 'Data tidak terupdate.'
                    ];
                }
            } else {
                $return = [
                    'status' => false,
                    'message' => 'ID Category tidak ditemukan atau salah.'
                ];
            }
        } else {
            $return = [
                'status' => false,
                'message' => 'ID Product tidak ditemukan atau salah.'
            ];
        }
        return $return;
    }

    /**
     * DELETE method.
     *
     * @return Response
     */
    public function delete($id)
    {
        $this->db->delete('products', array('product_id' => $id));
        return $this->db->affected_rows();
    }
}
