package com.example.demo.service;

import java.util.List;

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
//import com.example.demo.entity.ProfileUser;
import com.example.demo.entity.User;
import com.example.demo.repository.ContactRepository;
//import com.example.demo.repository.ProfileUserRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.rest.response.DataSourceRESTResponse;
import com.example.demo.utils.CipherUtils;

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
		User user = userRepository.save(newuser);
//		UserDTO newuser =  ContactMapper.INSTANCE.contactToContactDto(user);
		
		contTemp.setIdUser(user.getId());
//		contTemp.setUser(userd);
		
		Contact newContact = ContactMapper.INSTANCE.contactDTOtoContact(contTemp);
		Contact contact = contactRepository.save(newContact);
		
//		ProfileUser newpu = new ProfileUser(user.getId(), 3);
//		ProfileUser pucre = puserRepository.save(newpu);
//		
		
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
	public Integer editContact(ContactDTO editContactRequest) {
		Contact contact = ContactMapper.INSTANCE.contactDTOtoContact(editContactRequest);
		Contact editContact = contactRepository.save(fromEditContactRequest(contact));
		return editContact.getId();
	}

}
