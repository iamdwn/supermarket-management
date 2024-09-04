/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.DBContext;
import entities.supermarket;
import entities.type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author truon
 */
public class supermarketDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<type> getTypeSupermarket() {
        try {
            String query = "select * from dbo.Types";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<type> list = new ArrayList<>();
            while (rs.next()) {
                type sp = new type(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(sp);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<supermarket> getListSupermarket(String type) {
        try {
            String query = "select * from dbo.Item where type=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, type);
            rs = ps.executeQuery();
            List<supermarket> list = new ArrayList<>();
            while (rs.next()) {
                supermarket sp = new supermarket(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
                list.add(sp);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void update(int id, String name, int price, int type) {

        try {
            String query = ("update Item set name='" + name + "', price=" + price + ", type= "+type+"where id=" + id + ";");
//            System.err.println(query);
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }

    }

    public void delete(int id) {
        try {
            String query = ("delete from [Item] where id=" + id + ";");
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }
}
