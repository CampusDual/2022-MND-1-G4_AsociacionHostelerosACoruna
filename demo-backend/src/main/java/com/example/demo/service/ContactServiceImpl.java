package com.example.demo.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.hibernate.mapping.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.borjaglez.springify.repository.filter.impl.AnyPageFilter;
import com.borjaglez.springify.repository.specification.SpecificationBuilder;
import com.example.demo.dto.ContactDTO;
import com.example.demo.dto.ExtendDTO;
import com.example.demo.dto.UserDTO;
import com.example.demo.dto.mapper.ContactMapper;
import com.example.demo.dto.mapper.UserMapper;
import com.example.demo.entity.Contact;
import com.example.demo.entity.Profile;
//import com.example.demo.entity.ProfileUser;
import com.example.demo.entity.User;
import com.example.demo.repository.ContactRepository;
//import com.example.demo.repository.ProfileUserRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.rest.response.DataSourceRESTResponse;
import com.example.demo.utils.CipherUtils;
//
@Service
public class ContactServiceImpl extends AbstractDemoService implements IContactService {

	/**
	 * Especificación JPA para {@link Contact}.
	 */
	@Autowired
	private ContactRepository contactRepository;
	@Autowired
	private UserRepository userRepository;

//	@Autowired
//	private ProfileUserRepository puserRepository;

	/**
	 * {@inheritDoc}
	 */
	@Override
	public ContactDTO getContact(Integer id) {
		Contact contact = contactRepository.findById(id).orElse(null);
		return ContactMapper.INSTANCE.contactToContactDto(contact);
	}
	
	@Override
	public ExtendDTO getExteds(Integer id) {
		Contact contact = contactRepository.findById(id).orElse(null);
		ContactDTO nuevo = ContactMapper.INSTANCE.contactToContactDto(contact);
		CipherUtils cipher = new CipherUtils();
		String desencriptado = cipher.decrypt(nuevo.getUser().getLogin(), nuevo.getUser().getPassword());
		return new ExtendDTO(nuevo.getId(), nuevo.getName(), nuevo.getSurname1(), nuevo.getUser().getLogin(), desencriptado);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	@Transactional(readOnly = true)
	public DataSourceRESTResponse<List<ContactDTO>> getContacts(AnyPageFilter pageFilter) {
		checkInputParams(pageFilter);
		Page<Contact> contacts = SpecificationBuilder.selectDistinctFrom(contactRepository).where(pageFilter)
				.findAll(pageFilter);
		DataSourceRESTResponse<List<ContactDTO>> datares = new DataSourceRESTResponse<>();
		datares.setTotalElements((int) contacts.getTotalElements());
		List<ContactDTO> contactDtoList = ContactMapper.INSTANCE.contactToContactDtoList(contacts.getContent());
		datares.setData(contactDtoList);
		return datares;
	}
	 

//	public List<ContactDTO> maperlistwhitUser (List<Contact> contacts ){
//		 List<ContactDTO> conre;
//		contacts.forEach(contac ->{
//			ContactDTO inter= ContactMapper.INSTANCE.contactToContactDto(contac);
//			UserDTO interuser = UserMapper.INSTANCE.userTouserDto(contac.getUser());
//			
//			
//		});
//		
//		return null;
//		
//	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	@Transactional

	public ContactDTO createContact(ExtendDTO extenddto) {

    	CipherUtils cipher = new CipherUtils();
		ContactDTO contTemp = new ContactDTO();
		contTemp.setName(extenddto.getName());
		contTemp.setSurname1(extenddto.getSurname1());
		
		UserDTO userd = new UserDTO();
		userd.setLogin(extenddto.getLogin());
		userd.setPassword(cipher.encrypt(extenddto.getLogin(), extenddto.getPassword()));
		
		
		
		User newuser = UserMapper.INSTANCE.userDTOtoUser(userd);
		java.util.Set<Profile> a =new HashSet<Profile> ();
		a.add(new Profile(3));
		newuser.setProfiles(a);
		User user = userRepository.save(newuser);
//		UserDTO newuser =  ContactMapper.INSTANCE.contactToContactDto(user);
		
		contTemp.setIdUser(user.getId());
//		contTemp.setUser(userd);
		
		Contact newContact = ContactMapper.INSTANCE.contactDTOtoContact(contTemp);
		Contact contact = contactRepository.save(newContact);
		
		return ContactMapper.INSTANCE.contactToContactDto(contact);
		
		
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	@Transactional
	public Integer deleteContact(Integer id) {
		contactRepository.deleteById(id);
		return id;

	}

	@Override
	public List<ContactDTO> findAll() {

		List<Contact> contacts = contactRepository.findAll();
		return ContactMapper.INSTANCE.contactToContactDtoList(contacts);
	}

	@Override
	public Integer editContact(ExtendDTO editContactRequest) {
		
		CipherUtils cipher = new CipherUtils();
		ContactDTO contTemp = new ContactDTO();
		contTemp.setId(editContactRequest.getId());
		contTemp.setName(editContactRequest.getName());
		contTemp.setSurname1(editContactRequest.getSurname1());
		Integer idUser = getContact(editContactRequest.getId()).getIdUser();
		contTemp.setIdUser(idUser);
		
		UserDTO userd = new UserDTO();
		userd.setLogin(editContactRequest.getLogin());
		userd.setId(idUser);
		userd.setPassword(cipher.encrypt(editContactRequest.getLogin(), editContactRequest.getPassword()));
		
		contTemp.setUser(userd);
		Contact contact = ContactMapper.INSTANCE.contactDTOtoContact(contTemp);
//		contact.setIdUser(idUser);
		java.util.Set<Profile> a =new HashSet<Profile> ();
		a.add(new Profile(3));
		contact.getUser().setProfiles(a);
		Contact editContact = contactRepository.save(contact);
//		Contact editContact = contactRepository.save(fromEditContactRequest(contact));
		return editContact.getId();
//		return null;
	}

}
