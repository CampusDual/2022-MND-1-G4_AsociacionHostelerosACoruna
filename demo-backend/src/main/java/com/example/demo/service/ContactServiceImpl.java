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
import com.example.demo.entity.Contact;
import com.example.demo.repository.ContactRepository;
import com.example.demo.rest.response.DataSourceRESTResponse;
import com.example.demo.utils.CipherUtils;

@Service
public class ContactServiceImpl extends AbstractDemoService implements IContactService {

	/**
	 * Especificación JPA para {@link Contact}.
	 */
	@Autowired
	private ContactRepository contactRepository;

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
		
		
		Contact newuser = ContactMapper.INSTANCE.contactDTOtoContact(createContactRequestDTO);
		Contact user = contactRepository.save(newuser);
		UserDTO newuser =  ContactMapper.INSTANCE.contactToContactDto(contact);
		
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
	public Integer editContact(ContactDTO editContactRequest) {
		Contact contact = ContactMapper.INSTANCE.contactDTOtoContact(editContactRequest);
		Contact editContact = contactRepository.save(fromEditContactRequest(contact));
		return editContact.getId();
	}

}
